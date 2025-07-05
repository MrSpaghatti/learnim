# Description: Learn to define functions that return values.
# Hint: Specify the return type after the parameters: `proc multiply(a, b: int): int = return a * b`.
# The `return` keyword is used to give back the result.
# SandboxPreference: wasm
# Points: 15

# Task: Define a function named `calculateArea` that takes two integer parameters,
# `width` and `height`. The function should calculate and return their product (the area).
# Then, call this function with some dimensions and print the returned area.

# TODO: Define your `calculateArea` function here.

# TODO: Call your `calculateArea` function and print its results.
# Example:
# var area1 = calculateArea(5, 4)
# echo "Area 1: ", area1
# echo "Area 2: ", calculateArea(10, 7) # Direct print
echo "Function definition or calls not implemented." # Placeholder

# Do not modify the lines below; they are for testing.
when defined(testMode):
  discard
else:
  discard

# ExpectedOutput: ```
# Area of 5x4 is 20
# Area of 10x7 is 70
# Area of 3x3 is 9
# ```
