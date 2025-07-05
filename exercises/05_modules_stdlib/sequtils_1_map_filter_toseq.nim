# Description: Use functional helpers from `sequtils` like `map`, `filter`, and `toSeq`.
# Hint: `import sequtils`.
# `mySeq.map(proc(x: T): U = ...)` applies a proc to each element, returning a new seq.
# `mySeq.filter(proc(x: T): bool = ...)` keeps elements for which the proc returns true.
# `toSeq(for x in data: x ...)` is a concise way to create sequences (list comprehension style).
# SandboxPreference: wasm
# Points: 15

import sequtils

# Task:
# 1. Given `numbers = @[1, 2, 3, 4, 5]`:
#    a. Use `map` to create a new sequence where each number is squared. Print it.
#    b. Use `filter` to create a new sequence containing only the even numbers from the original. Print it.
# 2. Use `toSeq` with a `for` loop expression to create a sequence of the first 5 positive odd numbers (1, 3, 5, 7, 9). Print it.

proc main() =
  let numbers = @[1, 2, 3, 4, 5]
  echo "Original numbers: ", numbers

  # TODO: Task 1a - Map to squares
  # let squares = numbers.map(proc(x: int): int = x * x)
  # echo "Squares: ", squares
  echo "Map to squares not implemented." # Placeholder

  # TODO: Task 1b - Filter even numbers
  # let evens = numbers.filter(proc(x: int): bool = x mod 2 == 0)
  # echo "Evens: ", evens
  echo "Filter evens not implemented." # Placeholder

  # TODO: Task 2 - toSeq for first 5 odd numbers
  # let oddNumbers = toSeq(for i in 0..4: 2 * i + 1)
  # echo "First 5 odd numbers: ", oddNumbers
  echo "toSeq for odds not implemented." # Placeholder


# Do not modify the lines below; they are for testing.
when defined(testMode):
  main()
else:
  main()

# ExpectedOutput: ```
# Original numbers: @[1, 2, 3, 4, 5]
# Squares: @[1, 4, 9, 16, 25]
# Evens: @[2, 4]
# First 5 odd numbers: @[1, 3, 5, 7, 9]
# ```
