# Description: Learn about `tuple`s, fixed-size collections of heterogeneous types.
# Hint: Tuples are defined with parentheses: `var myTuple: tuple[name: string, age: int] = ("Nimrod", 5)`.
# Fields can be named or unnamed. Access unnamed fields by index `myTuple[0]`, named fields by `myTuple.name`.
# SandboxPreference: wasm
# Points: 10

# Task:
# 1. Define an unnamed tuple `point1` representing 2D coordinates (e.g., int x, int y). Initialize it to (10, 20).
# 2. Print its first element (x-coordinate) and second element (y-coordinate).
# 3. Define a named tuple `person` with fields `name: string` and `id: int`. Initialize it.
# 4. Print the `name` and `id` from the `person` tuple.
# 5. Use tuple unpacking to assign fields of `person` to two new variables `personName` and `personId`, then print them.

proc main() =
  # TODO: Step 1 - Define and initialize unnamed tuple `point1`.
  # var point1: tuple[x: int, y: int] = (10, 20) # Or just tuple[int, int]
  # echo "Point1 X: ", point1[0]
  # echo "Point1 Y: ", point1[1]
  echo "Unnamed tuple part not implemented." # Placeholder

  # TODO: Step 3 - Define and initialize named tuple `person`.
  # var person: tuple[name: string, id: int] = (name: "Alex", id: 101)
  # echo "Person Name: ", person.name
  # echo "Person ID: ", person.id
  echo "Named tuple part not implemented." # Placeholder

  # TODO: Step 5 - Tuple unpacking.
  # let (personName, personId) = person # Assuming person is defined
  # echo "Unpacked Name: ", personName
  # echo "Unpacked ID: ", personId
  echo "Unpacking part not implemented." # Placeholder


# Do not modify the lines below; they are for testing.
when defined(testMode):
  main()
else:
  main()

# ExpectedOutput: ```
# Point1 X: 10
# Point1 Y: 20
# Person Name: Alex
# Person ID: 101
# Unpacked Name: Alex
# Unpacked ID: 101
# ```
