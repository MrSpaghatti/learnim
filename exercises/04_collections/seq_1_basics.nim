# Description: Learn the basics of sequences (`seq`), Nim's dynamic arrays.
# Hint: Sequences can grow or shrink. Initialize with `@[]` for an empty seq of a type, or `newSeq[Type]()`.
# Add elements with `add()`. Access with `[]`. Get length with `len()`.
# SandboxPreference: wasm
# Points: 10

# Task:
# 1. Create an empty sequence of integers named `myNumbers`.
# 2. Add the numbers 10, 20, and 30 to `myNumbers`.
# 3. Access and print the element at index 1.
# 4. Print the length of the sequence.
# 5. Print the entire sequence.

proc main() =
  # TODO: Step 1 - Create an empty sequence of integers `myNumbers`.
  # var myNumbers: seq[int] = ...

  # TODO: Step 2 - Add 10, 20, 30 to `myNumbers`.
  # myNumbers.add(...)

  # TODO: Step 3 - Access and print the element at index 1.
  # echo "Element at index 1: ", myNumbers[...]

  # TODO: Step 4 - Print the length of the sequence.
  # echo "Length: ", myNumbers.len

  # TODO: Step 5 - Print the entire sequence.
  # echo "Sequence: ", myNumbers

  echo "Sequence basic operations not fully implemented." # Placeholder

# Do not modify the lines below; they are for testing.
when defined(testMode):
  main()
else:
  main()

# ExpectedOutput: ```
# Element at index 1: 20
# Length: 3
# Sequence: @[10, 20, 30]
# ```
