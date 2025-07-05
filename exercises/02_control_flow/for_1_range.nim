# Description: Learn to use `for` loops with ranges for a fixed number of iterations.
# Hint: A `for` loop iterates over a sequence of values. `a..b` creates an inclusive range.
# Example:
# for i in 1..3: # Iterates with i = 1, then i = 2, then i = 3
#   echo "Current value: ", i
# SandboxPreference: wasm
# Points: 10

# Task: Print the square of numbers from `start` up to (and including) `finish`.
# The `start` and `finish` variables will be provided.

proc printSquares*(startNum: int, finishNum: int) =
  if startNum > finishNum:
    echo "Start cannot be greater than finish."
    return

  # TODO: Write a for loop that iterates from `startNum` to `finishNum`.
  # Inside the loop, calculate the square of the current number and print it.
  # Example print: "Square of 3 is 9"
  echo "For loop not implemented yet." # Placeholder

# Do not modify the lines below; they are for testing.
when defined(testMode):
  printSquares(1, 5)
  echo "---"
  printSquares(-2, 2)
  echo "---"
  printSquares(3, 2) # Test edge case
else:
  printSquares(2, 4)

# ExpectedOutput: ```
# Square of 1 is 1
# Square of 2 is 4
# Square of 3 is 9
# Square of 4 is 16
# Square of 5 is 25
# ---
# Square of -2 is 4
# Square of -1 is 1
# Square of 0 is 0
# Square of 1 is 1
# Square of 2 is 4
# ---
# Start cannot be greater than finish.
# ```
