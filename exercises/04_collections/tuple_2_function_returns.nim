# Description: Use tuples to return multiple values from a function.
# Hint: Define the function's return type as a tuple: `proc getData(): tuple[int, string] = return (10, "Info")`.
# When calling, you can assign the result to a single tuple variable or unpack it directly.
# SandboxPreference: wasm
# Points: 15

# Task:
# 1. Define a function `getMinMax` that takes a sequence of integers `numbers`.
#    - If the sequence is empty, it should return `(0, 0)` (or handle error as you see fit, but this is simple for PoC).
#    - Otherwise, it should find and return the minimum and maximum numbers in the sequence as a tuple `(min: int, max: int)`.
# 2. Call `getMinMax` with a sample sequence and print the returned min and max.
# 3. Call `getMinMax` with an empty sequence and print the returned min and max.

# TODO: Define your `getMinMax` function here.
# proc getMinMax(numbers: seq[int]): tuple[minVal: int, maxVal: int] = ...

proc main() =
  let data1 = @[5, 1, 9, 3, 7]
  let data2: seq[int] = @[] # Empty sequence

  # TODO: Call getMinMax for data1 and print results
  # let (min1, max1) = getMinMax(data1)
  # echo "Data1 - Min:", min1, " Max:", max1
  echo "getMinMax for data1 not implemented." # Placeholder

  # TODO: Call getMinMax for data2 and print results
  # let (min2, max2) = getMinMax(data2)
  # echo "Data2 - Min:", min2, " Max:", max2
  echo "getMinMax for data2 not implemented." # Placeholder

# Do not modify the lines below; they are for testing.
when defined(testMode):
  main()
else:
  main()

# ExpectedOutput: ```
# Data1 - Min: 1 Max: 9
# Data2 - Min: 0 Max: 0
# ```
