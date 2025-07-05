# Description: Learn to use `while` loops for repeated execution as long as a condition is true.
# Hint: A `while` loop needs a condition that eventually becomes false to avoid an infinite loop.
# Make sure to initialize and update any variables used in the condition.
# Example:
# var i = 0
# while i < 3:
#   echo i
#   i = i + 1
# SandboxPreference: wasm
# Points: 10

# Task: Print numbers from 1 up to (and including) a given number `n`.
# The `n` variable will be provided.

proc countUpToN*(n: int) =
  var counter = 1
  # TODO: Write a while loop that prints `counter`
  # as long as `counter` is less than or equal to `n`.
  # Remember to increment `counter` inside the loop!
  if n < 1: # Handle cases where n is less than 1
      echo "Input n should be 1 or greater for this exercise." # Or print nothing, an empty output would be fine too.
      return # This exercise expects output only for n >= 1 for simplicity in ExpectedOutput.

  echo "While loop not implemented yet." # Placeholder

# Do not modify the lines below; they are for testing.
when defined(testMode):
  countUpToN(5)
  echo "---" # Separator for clarity in expected output
  countUpToN(1)
  echo "---"
  countUpToN(0) # Test edge case
else:
  countUpToN(3)

# ExpectedOutput: ```
# 1
# 2
# 3
# 4
# 5
# ---
# 1
# ---
# Input n should be 1 or greater for this exercise.
# ```
