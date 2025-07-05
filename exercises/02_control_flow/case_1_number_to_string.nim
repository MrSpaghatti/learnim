# Description: Learn to use `case` statements for multi-way branching based on a value.
# Hint: A `case` statement checks a variable against different values or conditions.
# Example:
# case myVar
# of 1: echo "One"
# of 2: echo "Two"
# else: echo "Other"
# SandboxPreference: wasm
# Points: 10

# Task: Convert a number (1-3) to its string representation.
# The `number` variable will be provided.
# - If `number` is 1, print "One".
# - If `number` is 2, print "Two".
# - If `number` is 3, print "Three".
# - For any other number, print "Unknown number".

proc numberToString*(number: int) =
  # TODO: Write your case statement here
  echo "Case logic not implemented for: ", number # Placeholder

# Do not modify the lines below; they are for testing.
when defined(testMode):
  numberToString(1)
  numberToString(2)
  numberToString(3)
  numberToString(5)
  numberToString(0)
else:
  numberToString(2)

# ExpectedOutput: ```
# One
# Two
# Three
# Unknown number
# Unknown number
# ```
