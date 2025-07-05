# Description: Learn to create and use your own simple modules.
# Hint: Create a separate file (e.g., `myutils.nim`) in the same directory.
# Define your procs/consts/etc. in it. Then, in this file, use `import myutils`.
# You can then call `myutils.procName()` or just `procName()` if it's not ambiguous.
# For this exercise, ensure you have a file named `myutils.nim` in the
# `exercises/05_modules_stdlib/` directory with the following content:
#
# ```nim
# # myutils.nim
# proc doubleIt*(x: int): int =
#   return x * 2
#
# proc informalGreeting*(name: string): string =
#   if name.len == 0:
#     return "Hey there!"
#   else:
#     return "Hey " & name & "!"
#
# const UtilityVersion* = "1.0"
# ```
# SandboxPreference: native # Multi-file compilation is simpler/more standard natively.
# Points: 20

# TODO: Add the necessary import statement here to import `myutils`.
# import ...

proc main() =
  # TODO: Call `doubleIt` from `myutils` with the number 7 and print the result.
  # Example: echo "Double of 7: ", myutils.doubleIt(7)
  echo "Call to doubleIt not implemented." # Placeholder

  # TODO: Call `informalGreeting` from `myutils` with "Nim Programmer" and print the result.
  # Example: echo myutils.informalGreeting("Nim Programmer")
  echo "Call to informalGreeting (with name) not implemented." # Placeholder

  # TODO: Call `informalGreeting` from `myutils` with an empty string and print the result.
  # Example: echo myutils.informalGreeting("")
  echo "Call to informalGreeting (empty) not implemented." # Placeholder

  # TODO: Print the `UtilityVersion` constant from `myutils`.
  # Example: echo "Utils Version: ", myutils.UtilityVersion
  echo "UtilityVersion print not implemented." # Placeholder


# Do not modify the lines below; they are for testing.
when defined(testMode):
  main()
else:
  main()

# ExpectedOutput: ```
# Double of 7: 14
# Hey Nim Programmer!
# Hey there!
# Utils Version: 1.0
# ```
