# Description: Learn about `Table`, Nim's hash table or dictionary for key-value pairs.
# Hint: Import `tables` module. Initialize with `initTable[KeyType, ValueType]()`.
# Add/update with `myTable[key] = value`. Access with `myTable[key]`.
# Check for key presence with `myTable.hasKey(key)` or `key in myTable`.
# SandboxPreference: wasm
# Points: 15

import tables

# Task: Manage a small inventory using a Table.
# 1. Create a Table `inventory` mapping item names (string) to quantities (int).
# 2. Add the following items: "apples" (10), "bananas" (5), "oranges" (8).
# 3. Print the quantity of "bananas".
# 4. Update the quantity of "apples" to 15.
# 5. Add a new item "cherries" with quantity 20.
# 6. Check if "grapes" are in the inventory and print a message (e.g., "Grapes in stock: false").
# 7. Print the final inventory (iterating or just `echo inventory`). For consistent test output,
#    it's often better to access and print known keys in a defined order if the table itself
#    doesn't guarantee order for `echo`. Or, the test can be flexible.
#    Let's print specific known items for predictable output.

proc main() =
  # TODO: Step 1 - Create the inventory table.
  # var inventory = ...

  # TODO: Step 2 - Add initial items.

  # TODO: Step 3 - Print quantity of "bananas".
  # echo "Bananas: ", inventory[...]

  # TODO: Step 4 - Update "apples".

  # TODO: Step 5 - Add "cherries".

  # TODO: Step 6 - Check for "grapes".
  # let hasGrapes = ...
  # echo "Grapes in stock: ", hasGrapes

  # TODO: Step 7 - Print final state of known items for predictable output.
  # echo "Current Apple stock: ", inventory["apples"]
  # echo "Current Banana stock: ", inventory["bananas"]
  # echo "Current Orange stock: ", inventory["oranges"]
  # echo "Current Cherry stock: ", inventory["cherries"]

  echo "Table operations not fully implemented." # Placeholder

# Do not modify the lines below; they are for testing.
when defined(testMode):
  main()
else:
  main()

# ExpectedOutput: ```
# Bananas: 5
# Grapes in stock: false
# Current Apple stock: 15
# Current Banana stock: 5
# Current Orange stock: 8
# Current Cherry stock: 20
# ```
