import std/os
import strutils
import options
import std/algorithm

const ExercisesDir = "exercises" # Relative to the project root or executable path

type
  Exercise* = object
    name*: string          # e.g., "variables1"
    path*: string          # Full path to the .nim file
    topic*: string         # e.g., "01_variables"
    description*: string   # Optional: A short description of the exercise
    hint*: string          # Optional: A hint for the exercise
    expectedOutput*: Option[string] # Optional: Expected stdout for validation
    validationScript*: Option[string] # Optional: Path to a custom validation script (.nims)
    pointsValue*: int               # Points awarded for completing this exercise
    sandboxPreference*: string      # "native" (default), "wasm"

proc getExercisesRootPath*(): string =
  # Try to find the 'exercises' directory relative to the executable
  # This makes it work when installed or run from different locations.
  var exePath = getAppDir()
  var candidatePath = exePath / ExercisesDir
  if dirExists(candidatePath):
    return candidatePath

  # Fallback for development: assume 'exercises' is in the current working dir or one level up
  if dirExists(ExercisesDir):
    return os.getCurrentDir() / ExercisesDir
  elif dirExists(".." / ExercisesDir): # If running from src/
    return os.getCurrentDir() / ".." / ExercisesDir
  else:
    # This should ideally not happen if the project structure is correct
    raise newException(IOError, "Could not find the 'exercises' directory. Searched in " & candidatePath & " and relative to current dir.")

proc discoverExercises*(): seq[Exercise] =
  ## Discovers all exercises in the ExercisesDir.
  ## Exercises are expected to be .nim files.
  ## The directory structure `ExercisesDir/topic_name/exercise_name.nim` is assumed.
  result = @[]
  let exercisesRoot = getExercisesRootPath()

  if not dirExists(exercisesRoot):
    echo "Warning: Exercises directory not found at: ", exercisesRoot
    return result

  for topicDirKind, topicDirPath in walkDir(exercisesRoot):
    if topicDirKind == pcDir:
      let topicName = lastPathPart(topicDirPath)
      for fileKind, filePath in walkDir(topicDirPath):
        if fileKind == pcFile and filePath.endsWith(".nim"):
          let exerciseName = lastPathPart(filePath).replace(".nim", "")
          # Basic parsing for description and hint from comments (can be enhanced)
          var description = ""
          var hint = ""
          var expectedOutputStr: Option[string] = none[string]()
          var validationScriptPath: Option[string] = none[string]()
          var points = 10 # Default points
          var sandboxPref = "native" # Default sandbox preference
          var multiLineExpectedOutput: seq[string] = @[]
          var inExpectedOutputBlock = false

          try:
            for line in lines(filePath):
              let strippedLine = line.strip()
              if strippedLine.startsWith("# Description:"):
                description = strippedLine.split(":", 1)[1].strip()
              elif strippedLine.startsWith("# Hint:"):
                hint = strippedLine.split(":", 1)[1].strip()
              elif strippedLine.startsWith("# Points:"):
                try:
                  points = parseInt(strippedLine.split(":", 1)[1].strip())
                except ValueError:
                  echo "Warning: Could not parse Points value in ", filePath, ". Using default."
              elif strippedLine.startsWith("# ExpectedOutput:"):
                if strippedLine.split(":", 1)[1].strip() == "```":
                  inExpectedOutputBlock = true
                else:
                  expectedOutputStr = some(strippedLine.split(":", 1)[1].strip())
              elif inExpectedOutputBlock:
                if strippedLine == "# ```":
                  inExpectedOutputBlock = false
                  expectedOutputStr = some(multiLineExpectedOutput.join("\n"))
                else:
                  # Remove leading "# " or "#" from multiline comments
                  if strippedLine.startsWith("# "):
                    multiLineExpectedOutput.add(strippedLine[2..^1])
                  elif strippedLine.startsWith("#"):
                    multiLineExpectedOutput.add(strippedLine[1..^1])
                  else: # Should not happen if correctly formatted
                    multiLineExpectedOutput.add(strippedLine) # Or raise error
              elif strippedLine.startsWith("# ValidationScript:"):
                validationScriptPath = some(strippedLine.split(":", 1)[1].strip())
              elif strippedLine.startsWith("# SandboxPreference:"):
                sandboxPref = strippedLine.split(":", 1)[1].strip().toLower()
                if sandboxPref notin ["native", "wasm"]:
                  echo "Warning: Invalid SandboxPreference '", sandboxPref, "' in ", filePath, ". Defaulting to 'native'."
                  sandboxPref = "native"

          except IOError:
            echo "Warning: Could not read exercise file for metadata: ", filePath

          result.add(Exercise(
            name: exerciseName,
            path: filePath,
            topic: topicName,
            description: description,
            hint: hint,
            expectedOutput: expectedOutputStr,
            validationScript: validationScriptPath,
            pointsValue: points,
            sandboxPreference: sandboxPref
          ))

  # Sort exercises by topic and then by name for consistent order
  result.sort(proc(a, b: Exercise): int =
    if a.topic == b.topic:
      cmp(a.name, b.name)
    else:
      cmp(a.topic, b.topic)
  )

proc findExercise*(nameOrPathFragment: string, allExercises: seq[Exercise]): Option[Exercise] =
  ## Finds an exercise by its name or a unique fragment of its path.
  # Try exact name match first
  for exercise in allExercises:
    if exercise.name == nameOrPathFragment:
      return some(exercise)

  # Try path fragment match
  var found: Option[Exercise] = none(Exercise)
  var multipleFound = false
  for exercise in allExercises:
    if nameOrPathFragment in exercise.path:
      if found.isSome():
        multipleFound = true
        break
      else:
        found = some(exercise)

  if multipleFound:
    echo "Multiple exercises match '", nameOrPathFragment, "'. Please be more specific."
    return none(Exercise)

  return found

when isMainModule:
  # Create dummy exercise files for testing
  proc createDummyExercise(path: string, desc: string = "", hintText: string = "") =
    let dir = parentDir(path)
    createDir(dir)
    var content = "# Dummy exercise file\n\n"
    if desc != "": content &= "# Description: " & desc & "\n"
    if hintText != "": content &= "# Hint: " & hintText & "\n"
    content &= "echo \"Hello from " & lastPathPart(path) & "\"\n"
    writeFile(path, content)

  let baseTestPath = "test_exercises_temp"
  createDir(baseTestPath)
  defer: removeDir(baseTestPath) # Clean up

  # Override ExercisesDir for testing
  var oldExercisesDir = ExercisesDir
  global ExercisesDir # Nim requires this to modify global from local scope
  ExercisesDir = baseTestPath

  createDummyExercise(baseTestPath / "01_intro" / "intro1.nim", "A simple intro.", "Try `echo`.")
  createDummyExercise(baseTestPath / "01_intro" / "intro2.nim", "Another intro.")
  createDummyExercise(baseTestPath / "02_variables" / "vars1.nim", "Working with vars.", "Declare with `var` or `let`.")

  let exercises = discoverExercises()
  echo "Discovered exercises:"
  for ex in exercises:
    echo "  - ", ex.topic, "/", ex.name, " (Path: ", ex.path, ")"
    if ex.description != "": echo "    Desc: ", ex.description
    if ex.hint != "": echo "    Hint: ", ex.hint

  echo "\nFinding 'intro1':"
  let found1 = findExercise("intro1", exercises)
  if found1.isSome:
    echo "  Found: ", found1.get.path
  else:
    echo "  Not found."

  echo "\nFinding 'vars1':"
  let found2 = findExercise("vars1", exercises)
  if found2.isSome:
    echo "  Found: ", found2.get.path
  else:
    echo "  Not found."

  echo "\nFinding 'intro' (ambiguous):"
  let found3 = findExercise("intro", exercises)
  if found3.isSome:
    echo "  Found: ", found3.get.path
  else:
    echo "  Not found or ambiguous."

  echo "\nFinding '02_variables/vars1.nim':"
  let found4 = findExercise("02_variables/vars1.nim", exercises)
  if found4.isSome:
    echo "  Found: ", found4.get.path
  else:
    echo "  Not found."

  # Restore ExercisesDir
  ExercisesDir = oldExercisesDir
