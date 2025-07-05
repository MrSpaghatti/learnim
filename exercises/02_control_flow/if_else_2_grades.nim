# Description: Practice using `if`, `elif`, and `else` for multiple conditions.
# Hint: `elif` allows you to check another condition if the previous `if` or `elif` was false.
# Remember that the conditions are checked in order.
# SandboxPreference: wasm
# Points: 10

# Task: Assign a letter grade based on a score.
# The `score` variable will be provided.
# - Score 90-100: "Grade: A"
# - Score 80-89:  "Grade: B"
# - Score 70-79:  "Grade: C"
# - Score 60-69:  "Grade: D"
# - Score below 60: "Grade: F"

proc assignGrade*(score: int) =
  # TODO: Implement the grading logic using if/elif/else
  if score >= 90:
    echo "Grade: A"
  # Add more elif blocks for B, C, D
  # Add an else block for F


# Do not modify the lines below; they are for testing.
when defined(testMode):
  assignGrade(95)
  assignGrade(82)
  assignGrade(75)
  assignGrade(60)
  assignGrade(40)
  assignGrade(100) # Edge case for A
  assignGrade(89)  # Edge case for B
  assignGrade(0)   # Edge case for F
else:
  assignGrade(88) # Test with a different value

# ExpectedOutput: ```
# Grade: A
# Grade: B
# Grade: C
# Grade: D
# Grade: F
# Grade: A
# Grade: B
# Grade: F
# ```
