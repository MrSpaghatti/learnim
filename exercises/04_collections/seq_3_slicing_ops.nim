# Description: Explore sequence slicing and other common operations.
# Hint: Slicing `s[a..b]` creates a new sequence. `a` is inclusive, `b` can be inclusive or exclusive depending on `..<` vs `..`.
# `s[a..<b]` means up to, but not including, index `b`. `s[a..^1]` means up to the last element.
# `&` concatenates sequences. `delete(s, index)` removes an element. `insert(s, value, index)` adds one.
# SandboxPreference: wasm
# Points: 15

# Task 1: Given `originalSeq = @[0, 1, 2, 3, 4, 5]`:
#   a. Create `slice1` containing elements from index 1 up to (and including) index 3.
#   b. Create `slice2` containing elements from index 2 up to the end of the sequence.
#   c. Create `slice3` containing the first 3 elements.
# Task 2: Concatenate `slice1` and `slice3` into `combinedSeq`.
# Task 3: From `originalSeq` (imagine it's mutable or a copy for this task):
#   a. Delete the element at index 0.
#   b. Insert the number 99 at index 2 (of the modified sequence).
# Print all resulting sequences.

proc main() =
  let originalSeq = @[0, 1, 2, 3, 4, 5]
  echo "Original: ", originalSeq

  # TODO: Task 1
  # var slice1: seq[int] = ...
  # var slice2: seq[int] = ...
  # var slice3: seq[int] = ...
  # echo "Slice 1 (1..3): ", slice1
  # echo "Slice 2 (2..end): ", slice2
  # echo "Slice 3 (first 3): ", slice3
  echo "Slicing not implemented." # Placeholder

  # TODO: Task 2
  # var combinedSeq: seq[int] = ...
  # echo "Combined (slice1 & slice3): ", combinedSeq
  echo "Concatenation not implemented." # Placeholder

  # TODO: Task 3
  var mutableSeq = originalSeq # Create a mutable copy
  # mutableSeq.delete(...)
  # mutableSeq.insert(...)
  # echo "Modified (delete 0, insert 99 at 2): ", mutableSeq
  echo "Modification not implemented." # Placeholder


# Do not modify the lines below; they are for testing.
when defined(testMode):
  main()
else:
  main()

# ExpectedOutput: ```
# Original: @[0, 1, 2, 3, 4, 5]
# Slice 1 (1..3): @[1, 2, 3]
# Slice 2 (2..end): @[2, 3, 4, 5]
# Slice 3 (first 3): @[0, 1, 2]
# Combined (slice1 & slice3): @[1, 2, 3, 0, 1, 2]
# Modified (delete 0, insert 99 at 2): @[1, 2, 99, 3, 4, 5]
# ```
