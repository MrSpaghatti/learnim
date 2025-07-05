# Description: Explore more features of `case` statements, like using sets or ranges.
# Hint: You can use sets `{'a', 'b'}` or ranges `low..high` in `of` branches.
# Example:
# case myChar
# of 'a'..'z': echo "Lowercase letter"
# of {'0'..'9'}: echo "Digit" # Note: {'0'..'9'} is a set of characters, not numbers directly
# else: echo "Other character"
# SandboxPreference: wasm
# Points: 15

# Task: Identify the type of a given character.
# The `charInput` variable will be provided.
# - If `charInput` is a lowercase vowel ('a', 'e', 'i', 'o', 'u'), print "Lowercase vowel".
# - If `charInput` is any other lowercase letter, print "Lowercase consonant".
# - If `charInput` is a digit ('0' through '9'), print "Digit".
# - For any other character, print "Other symbol".

proc identifyChar*(charInput: char) =
  # TODO: Write your case statement here.
  # Remember to handle lowercase vowels, lowercase consonants, digits, and others.
  echo "Case logic not implemented for: ", charInput # Placeholder

# Do not modify the lines below; they are for testing.
when defined(testMode):
  identifyChar('a')
  identifyChar('e')
  identifyChar('b')
  identifyChar('z')
  identifyChar('5')
  identifyChar('0')
  identifyChar('9')
  identifyChar('$')
  identifyChar('A') # Should be "Other symbol" as we only check lowercase
else:
  identifyChar('x')

# ExpectedOutput: ```
# Lowercase vowel
# Lowercase vowel
# Lowercase consonant
# Lowercase consonant
# Digit
# Digit
# Digit
# Other symbol
# Other symbol
# ```
