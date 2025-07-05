# Description: Practice `while` loops with a condition that depends on accumulated values.
# Hint: Initialize an accumulator variable before the loop. Update it inside the loop.
# The loop continues as long as the accumulator meets a certain condition.
# SandboxPreference: wasm
# Points: 15

# Task: Start with a sum of 0. Keep adding consecutive positive integers (1, then 2, then 3, ...)
# to the sum as long as the sum itself is less than a given `limit`.
# Print each number that is added, and finally print the total sum achieved
# (which might be >= limit because the last added number pushed it over).
# Also print how many numbers were added.

proc sumUntilLimit*(limit: int) =
  var sum = 0
  var currentNumber = 0 # Start with 0, will become 1 in first iteration
  var numbersAddedCount = 0

  echo "Limit: ", limit
  # TODO: Implement the while loop.
  # The loop should continue as long as `sum < limit`.
  # Inside the loop:
  #   - Increment `currentNumber`.
  #   - Add `currentNumber` to `sum`.
  #   - Increment `numbersAddedCount`.
  #   - Print the `currentNumber` that was just added (e.g., "Added: 3").

  echo "While loop not fully implemented." # Placeholder

  # After the loop, print the final results:
  # echo "Total sum: ", sum
  # echo "Numbers added: ", numbersAddedCount


# Do not modify the lines below; they are for testing.
when defined(testMode):
  sumUntilLimit(10)
  echo "---"
  sumUntilLimit(20)
  echo "---"
  sumUntilLimit(1) # Edge case: limit is 1, should add 1, sum becomes 1.
  echo "---"
  sumUntilLimit(0) # Edge case: limit is 0, should not add any numbers.
else:
  sumUntilLimit(15)

# ExpectedOutput: ```
# Limit: 10
# Added: 1
# Added: 2
# Added: 3
# Added: 4
# Total sum: 10
# Numbers added: 4
# ---
# Limit: 20
# Added: 1
# Added: 2
# Added: 3
# Added: 4
# Added: 5
# Total sum: 15
# Numbers added: 5
# ---
# Limit: 1
# Added: 1
# Total sum: 1
# Numbers added: 1
# ---
# Limit: 0
# Total sum: 0
# Numbers added: 0
# ```
