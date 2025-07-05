# Description: Explore basic set operations like union, intersection, and difference.
# Hint: Import `sets`.
# Union (all items from both sets): `set1 + set2` or `set1.union(set2)`
# Intersection (items present in both sets): `set1 * set2` or `set1.intersect(set2)`
# Difference (items in set1 but not in set2): `set1 - set2` or `set1.difference(set2)`
# Remember to convert to sorted sequences for predictable `ExpectedOutput`.
# SandboxPreference: wasm
# Points: 15

import sets
import algorithm # For sort

# Task: Given two sets of integers:
#   setA = {1, 2, 3, 4}
#   setB = {3, 4, 5, 6}
# 1. Calculate and print their union.
# 2. Calculate and print their intersection.
# 3. Calculate and print their difference (setA - setB).
# 4. Calculate and print their difference (setB - setA).

proc main() =
  let setA = toHashSet([1, 2, 3, 4])
  let setB = toHashSet([3, 4, 5, 6])

  echo "Set A: ", toSeq(setA.items).sorted(system.cmp) # Print sorted for clarity
  echo "Set B: ", toSeq(setB.items).sorted(system.cmp)

  # TODO: Task 1 - Union
  # let unionSet = ...
  # echo "Union (A + B): ", toSeq(unionSet.items).sorted(system.cmp)

  # TODO: Task 2 - Intersection
  # let intersectionSet = ...
  # echo "Intersection (A * B): ", toSeq(intersectionSet.items).sorted(system.cmp)

  # TODO: Task 3 - Difference (A - B)
  # let diffAB = ...
  # echo "Difference (A - B): ", toSeq(diffAB.items).sorted(system.cmp)

  # TODO: Task 4 - Difference (B - A)
  # let diffBA = ...
  # echo "Difference (B - A): ", toSeq(diffBA.items).sorted(system.cmp)

  echo "Set operations not fully implemented." # Placeholder


# Do not modify the lines below; they are for testing.
when defined(testMode):
  main()
else:
  main()

# ExpectedOutput: ```
# Set A: @[1, 2, 3, 4]
# Set B: @[3, 4, 5, 6]
# Union (A + B): @[1, 2, 3, 4, 5, 6]
# Intersection (A * B): @[3, 4]
# Difference (A - B): @[1, 2]
# Difference (B - A): @[5, 6]
# ```
