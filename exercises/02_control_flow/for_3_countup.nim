# Description: Learn about `countup` and `countdown` in `for` loops.
# Hint: `for i in countup(start, finish, step)` iterates from `start` to `finish` with a custom `step`.
# `countdown` works similarly but goes downwards.
# SandboxPreference: wasm
# Points: 10

# Task: Print even numbers from a `start` value to a `finish` value (inclusive) using `countup`.
# Then, print numbers from `finish` down to `start` (inclusive) with a step of 2, using `countdown`.

proc demoCountUpDown*(startNum: int, finishNum: int) =
  echo "Even numbers using countup (if start is odd, first even will be start+1 or start):"
  # TODO: Use a for loop with `countup(startNum, finishNum)`.
  # Inside the loop, check if the number `i` is even. If so, print it.
  # (An alternative is to adjust startNum to be the first even number and use a step of 2 in countup,
  # but for this exercise, let's practice the `if` inside the loop).
  echo "Countup part not implemented." # Placeholder

  echo "\nNumbers using countdown with step 2:"
  # TODO: Use a for loop with `countdown(finishNum, startNum, 2)`. Print each number.
  echo "Countdown part not implemented." # Placeholder

# Do not modify the lines below; they are for testing.
when defined(testMode):
  demoCountUpDown(1, 10)
  echo "---"
  demoCountUpDown(2, 7)
else:
  demoCountUpDown(3, 9)

# ExpectedOutput: ```
# Even numbers using countup (if start is odd, first even will be start+1 or start):
# 2
# 4
# 6
# 8
# 10
#
# Numbers using countdown with step 2:
# 10
# 8
# 6
# 4
# 2
# ---
# Even numbers using countup (if start is odd, first even will be start+1 or start):
# 2
# 4
# 6
#
# Numbers using countdown with step 2:
# 7
# 5
# 3
# ```
