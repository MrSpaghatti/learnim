# Description: Practice iterating over Tables and a common use case: counting word frequencies.
# Hint: Import `tables` and `strutils`. Use `for key, value in myTable.pairs:` to iterate.
# `splitWhitespace()` from `strutils` can split a string into words.
# To update counts: `countsTable.mgetOrPut(word, 0) += 1` is a handy pattern.
# SandboxPreference: wasm
# Points: 20

import tables
import strutils # For splitWhitespace and toLowerAscii

# Task: Given a text (string), count the frequency of each word.
# Words should be case-insensitive (convert to lowercase before counting).
# Print the word counts. For predictable test output, print for specific words
# if they exist, or print all sorted by word if the output format allows.
# Let's print counts for "nim", "is", "fun", "and".

proc countWordFrequencies*(text: string) =
  var wordCounts = initTable[string, int]()
  let words = text.toLowerAscii().splitWhitespace()

  # TODO: Iterate through `words`. For each word, update its count in `wordCounts`.
  # Use `wordCounts.mgetOrPut(word, 0) += 1` or similar logic.

  echo "Word counting not fully implemented." # Placeholder

  # For predictable output in tests, let's check for specific words:
  echo "Count of 'nim': ", wordCounts.getOrDefault("nim")
  echo "Count of 'is': ", wordCounts.getOrDefault("is")
  echo "Count of 'fun': ", wordCounts.getOrDefault("fun")
  echo "Count of 'and': ", wordCounts.getOrDefault("and") # Will be 0 if not present
  echo "Count of 'powerful': ", wordCounts.getOrDefault("powerful")


# Do not modify the lines below; they are for testing.
when defined(testMode):
  countWordFrequencies("Nim is fun. Nim is also powerful.")
  echo "---"
  countWordFrequencies("A simple test for a simple counter.")
else:
  countWordFrequencies("Test this sentence for this and This!")

# ExpectedOutput: ```
# Count of 'nim': 2
# Count of 'is': 2
# Count of 'fun': 1
# Count of 'and': 0
# Count of 'powerful': 1
# ---
# Count of 'nim': 0
# Count of 'is': 0
# Count of 'fun': 0
# Count of 'and': 0
# Count of 'powerful': 0
# ```
