# Description: Learn to use `if` and `else` statements to make decisions.
# Hint: An `if` statement executes code if a condition is true. An `else` block executes if the condition is false.
# Example:
# if condition:
#   echo "Condition is true"
# else:
#   echo "Condition is false"
# SandboxPreference: wasm
# Points: 10

# Task: Fix the code below.
# The variable `number` will be set by the test. You don't need to change its declaration.
# Your task is to complete the if/else structure to:
# - Print "Positive" if `number` is greater than 0.
# - Print "Negative" if `number` is less than 0.
# - Print "Zero" if `number` is exactly 0.
#
# You will need to use `if`, `elif` (else if), and `else`.

proc checkNumber*(number: int) =
  # TODO: Write your if/elif/else statement here
  if number > 0:
    echo "Positive"
  # Add an elif condition for negative numbers
  # Add an else condition for zero

# Do not modify the lines below; they are for testing.
when defined(testMode):
  checkNumber(5)
  checkNumber(-3)
  checkNumber(0)
else:
  # You can change this value to test your code manually
  checkNumber(10)

# ExpectedOutput: ```
# Positive
# Negative
# Zero
# ```
