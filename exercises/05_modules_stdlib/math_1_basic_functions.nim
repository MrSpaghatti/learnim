# Description: Learn to use common functions from the `math` standard library module.
# Hint: You need to `import math` to use these functions.
# Common functions include `sqrt()` (square root), `pow(base, exp)` (power),
# `ceil()` (round up), `floor()` (round down), `abs()` (absolute value).
# SandboxPreference: wasm
# Points: 10

import math # Import the math module

# Task:
# 1. Calculate and print the square root of 25.0.
# 2. Calculate and print 2 raised to the power of 5 (2^5).
# 3. Calculate and print the ceiling of 4.3.
# 4. Calculate and print the floor of 4.7.
# 5. Calculate and print the absolute value of -10.

proc main() =
  # TODO: Implement the tasks using functions from the math module.
  # Example for task 1:
  # let num1 = 25.0
  # echo "sqrt(", num1, ") = ", sqrt(num1)

  echo "Math function demonstrations not fully implemented." # Placeholder

# Do not modify the lines below; they are for testing.
when defined(testMode):
  main()
else:
  main()

# ExpectedOutput: ```
# sqrt(25.0) = 5.0
# pow(2.0, 5.0) = 32.0
# ceil(4.3) = 5.0
# floor(4.7) = 4.0
# abs(-10) = 10
# ```
