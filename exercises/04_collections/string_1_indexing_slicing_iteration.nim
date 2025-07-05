# Description: Learn to treat strings as collections of characters: indexing, slicing, and iteration.
# Hint: String indexing `s[i]` gives the character at index `i`. Slicing `s[a..b]` gives a substring.
# `for c in myString:` iterates over characters. Remember strings are 0-indexed.
# SandboxPreference: wasm
# Points: 10

# Task: Given the string `text = "Nim Language"`:
# 1. Print the character at index 0.
# 2. Print the character at index 4.
# 3. Create and print a slice containing "Lang" (from index 4 up to, but not including, index 8).
# 4. Create and print a slice containing the last 8 characters ("Language").
# 5. Iterate through the string and print each character on a new line.

proc main() =
  let text = "Nim Language"
  echo "Original text: ", text

  # TODO: Step 1 - Print character at index 0
  # echo "Char at 0: ", text[...]

  # TODO: Step 2 - Print character at index 4
  # echo "Char at 4: ", text[...]

  # TODO: Step 3 - Slice "Lang"
  # let sliceLang = text[... ..< ...]
  # echo "Slice 'Lang': ", sliceLang

  # TODO: Step 4 - Slice "Language" (last 8 chars)
  # Hint: text.len gives length. text[^N .. ^1] can get last N chars. Or calculate indices.
  # let sliceLanguage = text[text.len-8 .. ^1] # One way
  # echo "Slice 'Language': ", sliceLanguage

  # TODO: Step 5 - Iterate and print each character
  # echo "Characters:"
  # for c in text:
  #   echo c

  echo "String operations not fully implemented." # Placeholder

# Do not modify the lines below; they are for testing.
when defined(testMode):
  main()
else:
  main()

# ExpectedOutput: ```
# Original text: Nim Language
# Char at 0: N
# Char at 4: L
# Slice 'Lang': Lang
# Slice 'Language': Language
# Characters:
# N
# i
# m
#
# L
# a
# n
# g
# u
# a
# g
# e
# ```
