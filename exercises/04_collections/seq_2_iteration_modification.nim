# Description: Practice iterating over sequences and modifying them or creating new ones.
# Hint: Use a `for` loop to iterate. To create a new sequence with transformed elements,
# you can initialize an empty sequence and `add` to it, or use `newSeqWith(length, proc(i: int): T = ...)`
# or list comprehensions (more advanced, `for x in items: transform(x)` inside `@[...]`).
# SandboxPreference: wasm
# Points: 15

# Task 1: Given a sequence of integers, create a new sequence where each element is doubled.
# Task 2: Given a sequence of strings, print only the words that have a length greater than 3.

proc doubleElements*(inputSeq: seq[int]): seq[int] =
  var resultSeq: seq[int] = @[]
  # TODO: Task 1 - Iterate `inputSeq`. For each element, double it and add to `resultSeq`.
  if inputSeq.len == 0:
    return @[] # Return empty if input is empty.

  echo "Task 1 doubling not implemented." # Placeholder
  return inputSeq # Placeholder return

proc filterLongWords*(inputWords: seq[string]) =
  echo "Long words:"
  var found = false
  # TODO: Task 2 - Iterate `inputWords`. If a word's length is > 3, print it.
  # Set `found` to true if at least one long word is printed.

  if inputWords.len == 0:
    echo "(No words provided)"
    return

  echo "Task 2 filtering not implemented." # Placeholder
  if not found and inputWords.len > 0 : # Only print if not found and there were words
      echo "(No words longer than 3 characters)"


# Do not modify the lines below; they are for testing.
when defined(testMode):
  let doubled1 = doubleElements(@[1, 2, 3, 4])
  echo "Doubled 1: ", doubled1
  let doubled2 = doubleElements(@[])
  echo "Doubled 2: ", doubled2
  let doubled3 = doubleElements(@[-5, 0, 10])
  echo "Doubled 3: ", doubled3
  echo "---"
  filterLongWords(@["Nim", "is", "really", "cool", "and", "fun"])
  echo "---"
  filterLongWords(@["a", "b", "c"])
  echo "---"
  filterLongWords(@[])
else:
  let myNums = @[5, 1, 2]
  echo "Original: ", myNums
  echo "My Doubled: ", doubleElements(myNums)
  filterLongWords(@["short", "longerword", "tiny"])

# ExpectedOutput: ```
# Doubled 1: @[2, 4, 6, 8]
# Doubled 2: @[]
# Doubled 3: @[-10, 0, 20]
# ---
# Long words:
# really
# cool
# ---
# Long words:
# (No words longer than 3 characters)
# ---
# Long words:
# (No words provided)
# ```
