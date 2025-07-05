# This is a utility module for the custom module import exercise.
# It should be saved as `myutils.nim` in the same directory as
# `module_1_custom_import.nim`.

proc doubleIt*(x: int): int =
  ## Returns the double of the input integer.
  return x * 2

proc informalGreeting*(name: string): string =
  ## Returns an informal greeting string.
  if name.len == 0:
    return "Hey there!"
  else:
    return "Hey " & name & "!"

const UtilityVersion* = "1.0"
