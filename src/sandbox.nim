# Nimlings Sandbox Module
#
# Responsible for executing user-submitted exercise code in a more controlled environment.
#
# CURRENT STATUS: THIS IS A PLACEHOLDER AND NOT A SECURE SANDBOX.
# The current implementation directly uses osproc, which offers no real security isolation.
# WASM path is a Proof-of-Concept.
#
# --- Research & Future Directions for True Sandboxing ---
# (Research notes from previous steps remain relevant)
#

import osproc
import os
import strutils
import wasmer # For embedded WASM runtime
from wasmer import wasi # For WASI environment setup

# Conceptual Dependency: `wasmer` nimble package.

type RunResultFlag* = enum
  CompilationFailed,
  RuntimeFailed,
  ValidationFailed, # Note: This flag is set by the caller (runExercise), not directly here.
  Success

type SandboxedExecutionResult* = object
  flags*: set[RunResultFlag]
  compilationOutput*: string
  runtimeOutput*: string

proc executeWASM_PoC(filePath: string, exerciseDir: string): SandboxedExecutionResult =
  ## Proof-of-Concept for WASM execution.
  ## Attempts to compile to WASM. If successful, for this PoC, it runs the *original*
  ## .nim file via native compilation to get output for validation, as embedding a true
  ## WASM runtime and capturing its stdout is more involved for this stage.
  ## This version attempts to use `nim compile --os:wasi --cpu:wasm32 -r <file>`
  ## which relies on a system-configured WASI runner. (LEGACY PoC)
  var res: SandboxedExecutionResult
  let nimexe = "nim"

  echo "Attempting WASM compile & run (via nim c -r) for: ", filePath

  # Using `nim compile --os:wasi --cpu:wasm32 -r <file>`
  # This command handles both compilation and execution if a WASI runner is found.
  # Output will include compilation messages (if any) and runtime output/errors.
  var p = startProcess(nimexe,
                       args = ["compile", "--os:wasi", "--cpu:wasm32", "-r",
                               "--verbosity:0", "--hints:off", # Reduce nim's own chattiness
                               "--warning[ObservableStores]:off", # Common warning with WASI that's not from user code
                               filePath],
                       options = {poStdErrToStdOut, poUsePath},
                       workingDir = exerciseDir)

  var combinedOutputLines: seq[string]
  while p.running():
    if p.peekExitCode != -1: break
    var line = p.outputStream().readLine()
    if line.len > 0: combinedOutputLines.add(line)
  p.close()

  let exitCode = p.peekExitCode()
  let fullOutput = combinedOutputLines.join("\n")

  # It's hard to perfectly separate compilation vs runtime errors from `nim c -r` output.
  # If exitCode is non-zero, we'll assume it could be either.
  # A common pattern is that actual runtime output (like from `echo`) comes after
  # compiler messages if compilation was successful.
  # For this PoC, we'll put the whole thing in runtimeOutput if exitCode is 0,
  # and in compilationOutput if non-zero (as it's more likely a compile/setup issue).

  if exitCode == 0:
    res.flags = {Success}
    res.runtimeOutput = fullOutput
    # compilationOutput can be empty or contain warnings; for now, keep it simple.
    # Let's try to filter out known Nim info/warning lines to isolate user's echo.
    var actualRuntimeOutputLines: seq[string]
    var inProgramOutput = false
    for line in combinedOutputLines:
      # Heuristic: Nim's own messages often start with Hint, Info, Warning, Error etc.
      # or are specific paths. This is fragile.
      # A better way would be if `nim c -r` had flags to silence compiler output on success.
      # For now, if we see typical compiler output patterns, we might be before actual user echo.
      # If `filePath` is in the line, it's likely a compiler message.
      # This is very heuristic.
      if not (line.contains(filePath) and (line.contains(".nim(") or line.contains(" Hint:") or line.contains(" Warning:"))):
         # A more robust way could be to look for a specific marker if exercises always print one,
         # or assume all output is runtime if compilation *seems* to have passed (exit code 0).
        actualRuntimeOutputLines.add(line)

    # If filtering results in empty, use fullOutput; otherwise, use filtered.
    # This heuristic filtering is very basic.
    if actualRuntimeOutputLines.len > 0 and actualRuntimeOutputLines.join("").strip().len > 0:
       # A simple check if any line does not look like a compiler message
       var hasNonCompilerLikeLine = false
       for line in actualRuntimeOutputLines:
         if not (line.startsWith("Hint") or line.startsWith("Warning") or line.startsWith("Info") or line.startsWith("Success") or line.startsWith("CC:")):
           hasNonCompilerLikeLine = true
           break
       if hasNonCompilerLikeLine:
         res.runtimeOutput = actualRuntimeOutputLines.join("\n")
       else:
         res.runtimeOutput = fullOutput # Fallback if filtering was too aggressive or output was only Nim messages
    else:
       res.runtimeOutput = fullOutput


    res.compilationOutput = "WASM compilation and run via `nim c -r` reported success."
  else:
    res.flags = {CompilationFailed} # Could be runtime too, but `nim c -r` usually gives compile error first
    res.compilationOutput = "WASM compile & run via `nim c -r` failed. Output:\n" & fullOutput
    res.runtimeOutput = "" # No runtime output if it failed this way

  # No separate .wasm file to clean up with `nim c -r` typically (it's in nimcache or temp).
  return res

proc executeWASM_EmbedRuntime_PoC(filePath: string, exerciseDir: string): SandboxedExecutionResult =
  ## Proof-of-Concept for WASM execution using an embedded Wasmer runtime.
  ## This function attempts to:
  ## 1. Compile the input Nim source file (`.nim`) to a WebAssembly file (`.wasm`).
  ## 2. Load and execute this `.wasm` file using the Wasmer runtime.
  ## 3. Capture stdout/stderr from the WASM execution using OS pipes.
  ##
  ## Limitations of this PoC:
  ## - WASI Support: Basic stdout/stderr is implemented via WASI. More complex WASI
  ##   features (filesystem, networking, clocks, etc.) are not explicitly configured
  ##   or tested and would likely require more setup in `newWasiStateBuilder`.
  ## - Security: While WASM provides memory isolation, the overall security depends
  ##   on the WASI capabilities granted. This PoC does not implement fine-grained
  ##   capability restriction beyond what default WASI provides for stdio.
  ## - Performance: Wasmer execution will have overhead compared to native.
  ##   For Nimlings exercises, this is generally acceptable.
  ##
  var res: SandboxedExecutionResult
  let nimexe = "nim"
  let wasmOutFile = filePath.changeFileExt(".wasm") # Output of Nim compiler

  echo "Attempting WASM compilation (to .wasm file) for: ", filePath
  # 1. Compile .nim to .wasm file
  var pCompile = startProcess(nimexe,
                              args = ["compile", "--os:wasi", "--cpu:wasm32", "--out:" & wasmOutFile, "--compileOnly", filePath],
                              options = {poStdErrToStdOut, poUsePath},
                              workingDir = exerciseDir)
  var compileOutputLines: seq[string]
  while pCompile.running():
    if pCompile.peekExitCode != -1: break
    var line = pCompile.outputStream().readLine()
    if line.len > 0: compileOutputLines.add(line)
  pCompile.close()
  res.compilationOutput = compileOutputLines.join("\n")

  if pCompile.peekExitCode() != 0:
    res.flags = {CompilationFailed}
    if fileExists(wasmOutFile): removeFile(wasmOutFile) # Clean up partial output
    return res

  if not fileExists(wasmOutFile):
    res.flags = {CompilationFailed}
    res.compilationOutput &= "\nError: WASM compilation reported success, but output file " & wasmOutFile & " not found."
    return res

  echo "WASM compilation successful: ", wasmOutFile
  res.compilationOutput = "WASM Compilation to " & wasmOutFile & " successful.\n" & res.compilationOutput

  # 2. Execute the .wasm file with embedded Wasmer
  try:
    echo "Initializing Wasmer engine..."
    let engine = newEngine()
    let store = newStore(engine)

    echo "Reading WASM bytes from ", wasmOutFile, "..."
    let wasmBytes = readFile(wasmOutFile).toOpenArrayByte(0, readFile(wasmOutFile).len - 1)

    echo "Compiling WASM bytes with Wasmer..."
    let module = newModule(store, wasmBytes) # This is Wasmer's compilation of WASM bytes

    # Setup WASI environment
    # For stdout, we'll need to capture it. This is Step 2 of the plan.
    # For now, let's see if basic execution works. Output might go to console.
    echo "Setting up WASI environment..."
    # This is a simplified WASI setup.Stdout/stderr capture will need more work.
    var wasiEnv = newWasiStateBuilder("nimlings-exercise")
    # wasiEnv.mapDir("sandbox_temp", ".") # Example of mapping a directory if needed

    # For now, let's allow it to inherit stdout/stderr to see if it prints anything
    # wasiEnv.inheritStdout()
    # wasiEnv.inheritStderr()
    # In the next step, we'll replace inheritStdout/Stderr with pipes for capture.

    # Create pipes for stdout and stderr
    var pipeStdoutRead, pipeStdoutWrite: FileHandle
    var pipeStderrRead, pipeStderrWrite: FileHandle
    if not os.pipe(pipeStdoutRead, pipeStdoutWrite):
      res.flags = {RuntimeFailed}
      res.runtimeOutput = "Failed to create stdout pipe for WASM."
      if fileExists(wasmOutFile): removeFile(wasmOutFile)
      return res
    defer: pipeStdoutRead.close(); pipeStdoutWrite.close()

    if not os.pipe(pipeStderrRead, pipeStderrWrite):
      res.flags = {RuntimeFailed}
      res.runtimeOutput = "Failed to create stderr pipe for WASM."
      if fileExists(wasmOutFile): removeFile(wasmOutFile)
      return res
    defer: pipeStderrRead.close(); pipeStderrWrite.close()

    # Configure WASI to use these pipes
    wasiEnv.setStdout(pipeStdoutWrite)
    wasiEnv.setStderr(pipeStderrWrite)

    let importObject = wasiEnv.finalize(store, module)
    if importObject == nil:
      res.flags = {RuntimeFailed}
      res.runtimeOutput = "Failed to finalize WASI environment."
      if fileExists(wasmOutFile): removeFile(wasmOutFile)
      return res

    echo "Instantiating WASM module with Wasmer..."
    let instance = newInstance(store, module, importObject)

    echo "Getting '_start' function from WASM instance..."
    let startFunc = instance.exports.getProc("_start")
    if startFunc == nil:
      res.flags = {RuntimeFailed}
      res.runtimeOutput = "WASM Execution Error: _start function not found in module exports."
      if fileExists(wasmOutFile): removeFile(wasmOutFile)
      return res

    echo "Executing '_start' function (WASM)..."
    startFunc() # Call the _start function
    echo "WASM execution finished."

    # Close the write ends of the pipes before reading to signal EOF to readers.
    # This is important for `readAll` to not block indefinitely.
    pipeStdoutWrite.close()
    pipeStderrWrite.close()

    let capturedStdout = pipeStdoutRead.readAll()
    let capturedStderr = pipeStderrRead.readAll()

    if capturedStderr.len > 0:
      # If there's stderr, it might indicate a runtime issue even if no trap occurred.
      # For now, combine them. Consider how to report stderr distinctly if needed.
      res.runtimeOutput = "Stdout:\n" & capturedStdout & "\nStderr:\n" & capturedStderr
      # Potentially set a flag or modify success based on stderr content.
      # For this PoC, if startFunc didn't trap, we'll call it a Success from execution POV.
      # The content of stderr might lead to ValidationFailed later by the exercise logic.
      res.flags = {Success}
    else:
      res.runtimeOutput = capturedStdout
      res.flags = {Success}

    if res.runtimeOutput.strip().len == 0:
        res.runtimeOutput = "(WASM module produced no stdout/stderr)"


  except CatchableError as e: # Catch Wasmer specific errors or other Nim errors
    res.flags = {RuntimeFailed}
    res.runtimeOutput = "WASM Execution Error: " & e.name & " - " & e.msg
    # Ensure pipes are closed on error too, though defer should handle some of this.
    if pipeStdoutWrite.isAssociated: pipeStdoutWrite.close()
    if pipeStdoutRead.isAssociated: pipeStdoutRead.close()
    if pipeStderrWrite.isAssociated: pipeStderrWrite.close()
    if pipeStderrRead.isAssociated: pipeStderrRead.close()

  if fileExists(wasmOutFile): removeFile(wasmOutFile) # Clean up .wasm file
  return res


proc executeSandboxed*(
    filePath: string,
    exerciseDir: string,
    allowedReadPaths: seq[string] = @[],
    allowedWritePaths: seq[string] = @[],
    preference: string = "native"
  ): SandboxedExecutionResult =
  ## Executes the Nim code at filePath.
  ## Chooses execution path (native or WASM PoC) based on `preference`.
  ## WARNING: NATIVE PATH IS NOT SECURE. WASM PATH IS A PoC.

  if preference == "wasm":
    echo "Sandbox: WASM preference selected (Embedded Wasmer Runtime PoC path)."
    # return executeWASM_ViaNimRun_PoC(filePath, exerciseDir) # Old PoC
    return executeWASM_EmbedRuntime_PoC(filePath, exerciseDir) # New PoC

  # Default to native execution
  var res: SandboxedExecutionResult
  let nimexe = "nim"

  var p = startProcess(nimexe, args = ["check", filePath],
                       options = {poStdErrToStdOut, poUsePath}, workingDir = exerciseDir)
  var outputLines: seq[string]
  while p.running():
    if p.peekExitCode != -1: break
    var line = p.outputStream().readLine()
    if line.len > 0: outputLines.add(line)
  p.close()

  res.compilationOutput = outputLines.join("\n")
  if p.peekExitCode() != 0:
    res.flags = {CompilationFailed}
    return res

  let tempExeName = filePath.changeFileExt(".exe_temp_sandbox")
  p = startProcess(nimexe, args = ["compile", "--hints:off", "--verbosity:0", "--out:" & tempExeName, filePath],
                   options = {poStdErrToStdOut, poUsePath}, workingDir = exerciseDir)
  outputLines = @[]
  while p.running():
    if p.peekExitCode != -1: break
    var line = p.outputStream().readLine()
    if line.len > 0: outputLines.add(line)
  p.close()
  if outputLines.len > 0:
    res.compilationOutput = (if res.compilationOutput.len > 0: res.compilationOutput & "\n" else: "") & outputLines.join("\n")

  if p.peekExitCode() != 0:
    res.flags = {CompilationFailed}
    if fileExists(tempExeName): removeFile(tempExeName)
    return res

  if not fileExists(tempExeName):
    res.flags = {CompilationFailed}
    res.compilationOutput &= "\nError: Compiled executable not found at " & tempExeName
    return res

  p = startProcess(tempExeName, args = [],
                   options = {poUsePath, poStdErrToStdOut},
                   workingDir = exerciseDir)
  outputLines = @[] # Reset for runtime output
  while p.running():
    if p.peekExitCode != -1: break
    var line = p.outputStream().readLine()
    if line.len > 0: outputLines.add(line)
  p.close()
  res.runtimeOutput = outputLines.join("\n")

  if fileExists(tempExeName): removeFile(tempExeName)

  if p.peekExitCode() != 0:
    res.flags = {RuntimeFailed}
  else:
    res.flags = {Success}
  return res

when isMainModule:
  echo "Sandbox module - Test playground"

  proc testWasmExecution() =
    let testNimFile = "test_module.nim" # Assumes it's in the same dir when running sandbox.nim
    let testWasmFile = "test_module.wasm"
    let nimexe = "nim"

    echo "\n--- Testing WASM Compilation ---"
    var pCompile = startProcess(nimexe, args = ["compile", "--os:wasi", "--cpu:wasm32", "--out:" & testWasmFile, "--compileOnly", testNimFile],
                                options = {poStdErrToStdOut, poUsePath})
    var compileOutput: seq[string]
    while pCompile.running:
      if pCompile.peekExitCode != -1: break
      let line = pCompile.outputStream.readLine()
      if line.len > 0: compileOutput.add(line)
    pCompile.close()

    echo "WASM Compile Log:"
    for line in compileOutput: echo line

    if pCompile.peekExitCode() != 0:
      echo "WASM Compilation FAILED. Exit code: ", pCompile.peekExitCode()
      return
    if not fileExists(testWasmFile):
      echo "WASM Compilation reported success, but output file ", testWasmFile, " not found."
      return
    echo "WASM Compilation successful: ", testWasmFile

    echo "\n--- Testing WASM Execution (Attempting `nim r <wasm_file>`) ---"
    # Attempting to run the .wasm file directly using `nim r`
    # This relies on the system having a WASI runtime (like wasmtime) and Nim being configured to use it.
    var pRun: Process
    var runOutput: seq[string]
    var runCmdArgs: seq[string]

    # Some Nim versions might support `nim r test_module.wasm` directly if a wasm runner is found.
    # Other approaches might involve `nim js -r -o:output.js test_module.nim` then `node output.js`
    # or `nim c --os:wasi --cpu:wasm32 -r test_module.nim` (compiles and runs source directly to wasm)

    echo "Trying: nim c --os:wasi --cpu:wasm32 -r ", testNimFile
    # This command compiles to WASM and runs, effectively what we want for exercises if it works.
    pRun = startProcess(nimexe, args = ["compile", "--os:wasi", "--cpu:wasm32", "-r", "--verbosity:0", "--hints:off", testNimFile],
                        options = {poStdErrToStdOut, poUsePath})

    while pRun.running:
      if pRun.peekExitCode != -1: break
      let line = pRun.outputStream.readLine()
      if line.len > 0: runOutput.add(line)
    pRun.close()

    echo "WASM Execution Output (from `nim c -r ...`):"
    for line in runOutput: echo line

    if pRun.peekExitCode() == 0:
      echo "WASM Execution (via `nim c -r`) successful."
    else:
      echo "WASM Execution (via `nim c -r`) FAILED or produced no output. Exit code: ", pRun.peekExitCode()
      echo "This might indicate no suitable WASI runtime (like wasmtime) is in PATH or configured for Nim."

    # Clean up
    if fileExists(testWasmFile): removeFile(testWasmFile)
    # `nim c -r` might leave other artifacts, e.g. in nimcache. For this test, it's fine.

  if fileExists("test_module.nim"):
    testWasmExecution()
  else:
    echo "test_module.nim not found. Skipping WASM execution test."

  echo "\n--- Sandbox module testing complete ---"
