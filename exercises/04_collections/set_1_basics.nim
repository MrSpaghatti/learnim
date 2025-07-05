# Description: Learn about `HashSet`, Nim's collection of unique items.
# Hint: Import `sets`. Initialize with `initHashSet[Type]()` or `toHashSet(seqOrArray)`.
# Add items with `incl(mySet, item)`. Remove with `excl(mySet, item)`.
# Check membership with `item in mySet`. Sets do not maintain insertion order.
# SandboxPreference: wasm
# Points: 15

import sets

# Task: Manage a collection of unique tags.
# 1. Create an empty HashSet `tags` to store strings.
# 2. Include the tags: "nim", "learning", "fun".
# 3. Include the tag "nim" again (it should not create a duplicate).
# 4. Check if "learning" is in `tags` and print the result.
# 5. Check if "python" is in `tags` and print the result.
# 6. Exclude the tag "learning" from `tags`.
# 7. Print the number of items in `tags` using `len()`.
# 8. To print the set for ExpectedOutput, it's best to convert to a sorted sequence
#    because HashSet iteration order is not guaranteed.
#    Example: `var sortedTags = toSeq(tags.items); sortedTags.sort(system.cmp); echo sortedTags`

proc main() =
  # TODO: Step 1 - Create an empty HashSet for tags.
  # var tags = ...

  # TODO: Step 2 - Include "nim", "learning", "fun".

  # TODO: Step 3 - Include "nim" again.

  # TODO: Step 4 - Check for "learning".
  # echo "Has 'learning': ", "learning" in tags

  # TODO: Step 5 - Check for "python".
  # echo "Has 'python': ", "python" in tags

  # TODO: Step 6 - Exclude "learning".

  # TODO: Step 7 - Print length of tags.
  # echo "Number of tags: ", tags.len

  # TODO: Step 8 - Print sorted tags for predictable output.
  # var sortedTags = ...
  # echo "Final tags: ", sortedTags

  echo "Set operations not fully implemented." # Placeholder

# Do not modify the lines below; they are for testing.
when defined(testMode):
  main()
else:
  main()

# ExpectedOutput: ```
# Has 'learning': true
# Has 'python': false
# Number of tags: 2
# Final tags: @["fun", "nim"]
# ```
