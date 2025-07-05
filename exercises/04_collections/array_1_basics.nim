# Description: Learn about `array`, Nim's fixed-size collection type.
# Hint: Arrays are declared with a fixed size, e.g., `var numbers: array[5, int]`.
# The size must be a constant. Elements are accessed like sequences `myArray[index]`.
# Unlike sequences, arrays cannot grow or shrink after creation.
# SandboxPreference: wasm
# Points: 10

# Task:
# 1. Define an array named `weekdays` that can hold 7 strings.
# 2. Initialize it with the names of the days of the week (e.g., "Mon", "Tue", ..., "Sun").
# 3. Access and print the element at index 0 (Monday).
# 4. Modify the element at index 6 (Sunday) to "SUN" (all caps).
# 5. Iterate through the array and print each day.

proc main() =
  # TODO: Step 1 & 2 - Define and initialize `weekdays` array.
  # var weekdays: array[..., string] = [...]

  # TODO: Step 3 - Access and print element at index 0.
  # echo "First day: ", weekdays[...]

  # TODO: Step 4 - Modify element at index 6.
  # weekdays[...] = "SUN"

  # TODO: Step 5 - Iterate and print each day.
  # echo "All days:"
  # for day in weekdays:
  #   echo day

  echo "Array operations not fully implemented." # Placeholder

# Do not modify the lines below; they are for testing.
when defined(testMode):
  main()
else:
  main()

# ExpectedOutput: ```
# First day: Mon
# All days:
# Mon
# Tue
# Wed
# Thu
# Fri
# Sat
# SUN
# ```
