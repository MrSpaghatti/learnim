# Description: Use nested `if` statements or compound boolean conditions to solve a classic problem.
# Hint: A year is a leap year if it's divisible by 4,
#       unless it's divisible by 100 but not by 400.
#       Use the `mod` operator for divisibility check (e.g., `year mod 4 == 0`).
# SandboxPreference: wasm
# Points: 15

# Task: Determine if a year is a leap year.
# The `year` variable will be provided.
# Print "[year] is a leap year" or "[year] is not a leap year".

proc checkLeapYear*(year: int) =
  var isLeap = false
  # TODO: Implement the leap year logic.
  # You can use nested if statements:
  # if (year mod 4 == 0):
  #   if (year mod 100 == 0):
  #     if (year mod 400 == 0):
  #       isLeap = true
  #     else:
  #       isLeap = false # Divisible by 100 but not by 400
  #   else:
  #     isLeap = true # Divisible by 4 but not by 100
  # else:
  #   isLeap = false # Not divisible by 4

  # Or, you can use a single boolean expression:
  # isLeap = (year mod 4 == 0 and year mod 100 != 0) or (year mod 400 == 0)

  # Remove the line below and implement your logic.
  echo "Logic not implemented yet for year: ", year # Placeholder

  # After setting `isLeap` correctly, use this to print:
  # if isLeap:
  #   echo year, " is a leap year"
  # else:
  #   echo year, " is not a leap year"


# Do not modify the lines below; they are for testing.
when defined(testMode):
  checkLeapYear(2000) # Leap
  checkLeapYear(1900) # Not leap
  checkLeapYear(2024) # Leap
  checkLeapYear(2023) # Not leap
  checkLeapYear(1600) # Leap
else:
  checkLeapYear(1996)

# ExpectedOutput: ```
# 2000 is a leap year
# 1900 is not a leap year
# 2024 is a leap year
# 2023 is not a leap year
# 1600 is a leap year
# ```
