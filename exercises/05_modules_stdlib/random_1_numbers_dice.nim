# Description: Learn to generate pseudo-random numbers using the `random` module.
# Hint: `import random`. Call `randomize()` once at the start of your program to initialize
# the generator with a time-based seed for different results each run.
# `rand(maxVal)` generates an int between 0 and maxVal (inclusive).
# `rand(low..high)` generates an int in the range [low, high].
# `rand(floatVal)` generates a float between 0.0 and floatVal (exclusive of floatVal).
# SandboxPreference: native # Randomness, esp. if system-seeded, is better tested natively. WASI random might be limited.
# Points: 15

import random

# Task:
# 1. Initialize the random number generator. (Use a fixed seed for testMode).
# 2. Generate and print a random integer between 1 and 6 (inclusive, like a dice roll).
# 3. Generate and print another random integer between 1 and 6.
# 4. Generate and print a random float between 0.0 and 1.0 (exclusive of 1.0).
# 5. Generate and print a random integer between 50 and 100 (inclusive).

proc main() =
  # TODO: Step 1 - Initialize random number generator.
  # In testMode, use `setRandSeed(12345)` for predictable output.
  # Otherwise, use `randomize()`.
  when defined(testMode):
    setRandSeed(12345) # Fixed seed for testing
  else:
    randomize() # Time-based seed for normal runs

  # TODO: Step 2 - Roll a dice (1-6)
  # let die1 = ...
  # echo "Dice roll 1: ", die1
  echo "Dice roll 1 not implemented." # Placeholder

  # TODO: Step 3 - Roll another dice (1-6)
  # let die2 = ...
  # echo "Dice roll 2: ", die2
  echo "Dice roll 2 not implemented." # Placeholder

  # TODO: Step 4 - Random float (0.0 to <1.0)
  # let floatNum = ...
  # echo "Random float (0-1): ", floatNum
  echo "Random float not implemented." # Placeholder

  # TODO: Step 5 - Random int (50-100)
  # let intRange = ...
  # echo "Random int (50-100): ", intRange
  echo "Random int (50-100) not implemented." # Placeholder


# Do not modify the lines below; they are for testing.
when defined(testMode):
  main()
else:
  # For manual runs, you'll see different random numbers each time.
  main()

# ExpectedOutput for testMode (due to fixed seed): ```
# Dice roll 1: 4
# Dice roll 2: 6
# Random float (0-1): 0.3125940033378249
# Random int (50-100): 66
# ```
