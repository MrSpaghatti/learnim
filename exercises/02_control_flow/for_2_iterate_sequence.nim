# Description: Learn to use `for` loops to iterate over items in a collection like a sequence or array.
# Hint: You can iterate directly over the items using `for item in mySequence:`.
# You can also get both index and item using `for i, item in mySequence.pairs:`.
# SandboxPreference: wasm
# Points: 15

# Task 1: Given a sequence of strings `words`, print each word on a new line.
# Task 2: Given a sequence of integers `numbers`, calculate and print their sum.

proc processWords*(words: seq[string]) =
  echo "Words:"
  # TODO: Task 1 - Iterate through `words` and print each word.
  if words.len == 0:
    echo "(No words to print)"
  else:
    echo "Word iteration not implemented." # Placeholder

proc sumNumbers*(numbers: seq[int]) =
  var total = 0
  # TODO: Task 2 - Iterate through `numbers` and calculate their sum into `total`.
  if numbers.len == 0:
    echo "Sum: 0 (No numbers to sum)"
  else:
    echo "Sum calculation not implemented." # Placeholder, so actual sum is not printed yet.
    # After loop, print the sum like this:
    # echo "Sum: ", total


# Do not modify the lines below; they are for testing.
when defined(testMode):
  processWords(@["Nim", "is", "fun"])
  echo "---"
  processWords(@[])
  echo "---"
  sumNumbers(@[10, 20, 30])
  echo "---"
  sumNumbers(@[-1, 0, 1, 5])
  echo "---"
  sumNumbers(@[])
else:
  processWords(@["Hello", "Nimlings"])
  sumNumbers(@[1, 2, 3, 4, 5])

# ExpectedOutput: ```
# Words:
# Nim
# is
# fun
# ---
# Words:
# (No words to print)
# ---
# Sum: 60
# ---
# Sum: 5
# ---
# Sum: 0 (No numbers to sum)
# ```
