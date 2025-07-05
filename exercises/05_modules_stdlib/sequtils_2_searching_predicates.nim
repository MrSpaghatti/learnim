# Description: Practice searching and using predicate functions from `sequtils`.
# Hint: `import sequtils`.
# `mySeq.contains(item)` checks for an item's presence.
# `mySeq.all(proc(x: T): bool)` checks if the proc is true for all elements.
# `mySeq.any(proc(x: T): bool)` checks if the proc is true for at least one element.
# `mySeq.count(proc(x: T): bool)` counts elements for which the proc is true.
# `mySeq.find(item)` returns the index of the first occurrence of `item`, or -1 if not found.
# SandboxPreference: wasm
# Points: 15

import sequtils

# Task: Given `data = @["apple", "banana", "cherry", "date", "apricot"]`
# 1. Check if "cherry" is in `data`. Print the result.
# 2. Check if all words have a length greater than 3. Print the result.
# 3. Check if any word starts with "a". Print the result.
# 4. Count how many words end with the letter "e". Print the count.
# 5. Find the index of "banana". Print it.
# 6. Find the index of "fig" (which is not in the list). Print it.

proc main() =
  let data = @["apple", "banana", "cherry", "date", "apricot"]
  echo "Data: ", data

  # TODO: Task 1 - Contains "cherry"
  # echo "Contains 'cherry': ", data.contains("cherry")
  echo "Contains check not implemented." # Placeholder

  # TODO: Task 2 - All words length > 3
  # echo "All len > 3: ", data.all(proc(s: string): bool = s.len > 3)
  echo "All len > 3 check not implemented." # Placeholder

  # TODO: Task 3 - Any word starts with "a"
  # echo "Any starts with 'a': ", data.any(proc(s: string): bool = s.startsWith("a"))
  echo "Any starts with 'a' check not implemented." # Placeholder

  # TODO: Task 4 - Count words ending with "e"
  # echo "Count ending with 'e': ", data.count(proc(s: string): bool = s.endsWith("e"))
  echo "Count ending 'e' not implemented." # Placeholder

  # TODO: Task 5 - Find index of "banana"
  # echo "Index of 'banana': ", data.find("banana")
  echo "Find 'banana' not implemented." # Placeholder

  # TODO: Task 6 - Find index of "fig"
  # echo "Index of 'fig': ", data.find("fig")
  echo "Find 'fig' not implemented." # Placeholder


# Do not modify the lines below; they are for testing.
when defined(testMode):
  main()
else:
  main()

# ExpectedOutput: ```
# Data: @["apple", "banana", "cherry", "date", "apricot"]
# Contains 'cherry': true
# All len > 3: false
# Any starts with 'a': true
# Count ending with 'e': 2
# Index of 'banana': 1
# Index of 'fig': -1
# ```
