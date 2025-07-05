# Description: Practice searching within strings and more advanced manipulation with `strutils`.
# Hint: `import strutils`.
# `s.count(substring)` counts occurrences.
# `s.multiReplace( (old1, new1), (old2, new2) )` performs multiple replacements.
# `s.align(length, fillchar)` aligns a string.
# `s.parseInt()` converts a string to an integer (can raise ValueError).
# SandboxPreference: wasm
# Points: 15

import strutils

# Task:
# 1. Given `text = "nim is nim, and nim will be nim."`, count occurrences of "nim". Print the count.
# 2. Using the same `text`, perform multiple replacements: "nim" -> "Nim", "," -> ";". Print the result.
# 3. Align the string "Center" to a length of 20 characters using '*' as the fill character. Print it.
# 4. Parse the string "12345" into an integer and print the integer.
# 5. Attempt to parse "abc" into an integer. This will raise a ValueError.
#    For this exercise, we'll assume a successful parse for ExpectedOutput.
#    In a real program, you'd use a `try/except` block.

proc main() =
  # TODO: Task 1 - Count occurrences
  let text1 = "nim is nim, and nim will be nim."
  # let nimCount = text1.count("nim")
  # echo "Count of 'nim': ", nimCount
  echo "Counting not implemented." # Placeholder

  # TODO: Task 2 - Multiple replacements
  # let replacedText = text1.multiReplace(("nim", "NIM"), (",", ";")) # Note: Case-sensitive
  # To make it case-insensitive for "nim" -> "NIM", one might need a regex or loop,
  # or replace "nim" then "Nim" if the desired output is specific.
  # For this exercise, let's assume we want to replace lowercase "nim" only.
  # The expected output implies replacing "nim" with "NIM".
  # echo "Multi-replaced: ", replacedText
  echo "Multi-replace not implemented." # Placeholder

  # TODO: Task 3 - Align string
  let toAlign = "Center"
  # let alignedStr = toAlign.align(20, '*')
  # echo "Aligned: ", alignedStr
  echo "Align not implemented." # Placeholder

  # TODO: Task 4 - Parse integer
  let numStr = "12345"
  # let parsedNum = numStr.parseInt()
  # echo "Parsed int: ", parsedNum
  echo "ParseInt not implemented." # Placeholder

  # Task 5 is conceptual for now regarding error handling.
  # A real solution:
  # try:
  #   let _ = "abc".parseInt()
  #   echo "This should not print if abc is parsed."
  # except ValueError as e:
  #   echo "Error parsing 'abc': ", e.msg # This is what would happen.
  # For this exercise, we just need to show successful parse for task 4.


# Do not modify the lines below; they are for testing.
when defined(testMode):
  main()
else:
  main()

# ExpectedOutput: ```
# Count of 'nim': 4
# Multi-replaced: NIM is NIM; and NIM will be NIM.
# Aligned: *******Center********
# Parsed int: 12345
# ```
