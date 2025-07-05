# Description: Practice using common string manipulation functions from `strutils` and system.
# Hint: You might need `import strutils`. Functions like `len()`, `toUpperAscii()`, `toLowerAscii()`,
# `startsWith()`, `endsWith()`, `contains()`, `replace()`, `split()` are very useful.
# SandboxPreference: wasm
# Points: 15

import strutils # Usually good practice to import what you use

# Task: Given `phrase = "Nim is a versatile language!"`
# 1. Print its length.
# 2. Print it in all uppercase.
# 3. Print it in all lowercase.
# 4. Check if it starts with "Nim" and print the result (true/false).
# 5. Check if it ends with "!!" and print the result.
# 6. Check if it contains the word "versatile" and print the result.
# 7. Replace "versatile" with "powerful" and print the new phrase.
# 8. Split the original phrase into words (by space) and print the resulting sequence of words.

proc main() =
  let phrase = "Nim is a versatile language!"
  echo "Original phrase: ", phrase

  # TODO: Implement and print results for tasks 1-8.
  # Example for task 1:
  # echo "Length: ", phrase.len

  echo "String function demonstrations not fully implemented." # Placeholder


# Do not modify the lines below; they are for testing.
when defined(testMode):
  main()
else:
  main()

# ExpectedOutput: ```
# Original phrase: Nim is a versatile language!
# Length: 29
# Uppercase: NIM IS A VERSATILE LANGUAGE!
# Lowercase: nim is a versatile language!
# Starts with "Nim": true
# Ends with "!!": false
# Contains "versatile": true
# Replaced: Nim is a powerful language!
# Words: @["Nim", "is", "a", "versatile", "language!"]
# ```
