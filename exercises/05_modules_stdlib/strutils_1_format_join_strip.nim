# Description: Use functions from `strutils` for string formatting, joining, and cleaning.
# Hint: `import strutils`.
# `format(template, args...)` creates formatted strings (though `fmt"{var}"` from `strformat` is often preferred now, `strutils.format` is good to know).
# `join(seq, separator)` concatenates strings in a sequence.
# `isEmptyOrWhitespace(s)` checks if a string is empty or only whitespace.
# `strip(s)` removes leading/trailing whitespace.
# SandboxPreference: wasm
# Points: 15

import strutils # For most functions
import strformat # For fmt"" style formatting, which is common

# Task:
# 1. Use `fmt` (from `strformat`) to create a string: "User [name] (ID: [id])" with name="NimDeveloper" and id=123. Print it.
# 2. Create a sequence of strings: @["Nim", "is", "powerful"]. Join them with "---" as a separator and print.
# 3. Check if the string "   " is empty or whitespace and print the boolean result.
# 4. Check if the string "" is empty or whitespace and print the boolean result.
# 5. Given the string "  Hello Nim!  ", strip whitespace from both ends and print it, then print its length.

proc main() =
  # TODO: Task 1 - String formatting
  let name = "NimDeveloper"
  let id = 123
  # let formattedStr = fmt"User {name} (ID: {id})"
  # echo formattedStr
  echo "Formatting not implemented." # Placeholder

  # TODO: Task 2 - Join sequence
  let words = @["Nim", "is", "powerful"]
  # let joinedStr = words.join("---")
  # echo joinedStr
  echo "Joining not implemented." # Placeholder

  # TODO: Task 3 & 4 - Check isEmptyOrWhitespace
  let spacedStr = "   "
  let emptyStr = ""
  # echo "'   ' is empty/whitespace: ", spacedStr.isEmptyOrWhitespace()
  # echo "'' is empty/whitespace: ", emptyStr.isEmptyOrWhitespace()
  echo "isEmptyOrWhitespace checks not implemented." # Placeholder

  # TODO: Task 5 - Strip whitespace
  let paddedStr = "  Hello Nim!  "
  # let strippedStr = paddedStr.strip()
  # echo "Stripped: '", strippedStr, "'" # Use quotes to see lack of spaces
  # echo "Length of stripped: ", strippedStr.len
  echo "Stripping not implemented." # Placeholder


# Do not modify the lines below; they are for testing.
when defined(testMode):
  main()
else:
  main()

# ExpectedOutput: ```
# User NimDeveloper (ID: 123)
# Nim---is---powerful
# '   ' is empty/whitespace: true
# '' is empty/whitespace: true
# Stripped: 'Hello Nim!'
# Length of stripped: 10
# ```
