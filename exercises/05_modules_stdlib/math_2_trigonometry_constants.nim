# Description: Explore trigonometric functions and constants from the `math` module.
# Hint: `import math`. Functions like `sin()`, `cos()`, `tan()` take angles in radians.
# `PI` is a constant for π. `degToRad()` can convert degrees to radians.
# `radToDeg()` can convert radians to degrees.
# SandboxPreference: wasm
# Points: 15

import math

# Task:
# 1. Print the value of PI.
# 2. Calculate and print the sine of 90 degrees. (Hint: convert 90 degrees to radians first).
# 3. Calculate and print the cosine of PI radians (180 degrees).
# 4. Convert 1 radian to degrees and print it.

proc main() =
  # TODO: Implement the tasks.
  # Example for task 1:
  # echo "PI = ", PI

  echo "Trigonometry and constants not fully implemented." # Placeholder

# Do not modify the lines below; they are for testing.
# Note: Floating point comparisons can be tricky. ExpectedOutput uses reasonable precision.
when defined(testMode):
  main()
else:
  main()

# ExpectedOutput: ```
# PI = 3.141592653589793
# sin(90 deg) = 1.0
# cos(PI rad) = -1.0
# 1 rad in degrees = 57.29577951308232
# ```
