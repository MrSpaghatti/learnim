import os, strutils

let input = stdin.readAll()
var checksPassed = 0
var totalChecks = 4 # Update this if you add more tasks to variables2.nim

echo "--- Validation Script Output ---"

# Task 1: Check for "100"
if "100" in input:
  checksPassed += 1
  echo "[PASS] Task 1: '100' found in output."
else:
  echo "[FAIL] Task 1: '100' not found in output."

# Task 2: Check for "3.14159"
if "3.14159" in input:
  checksPassed += 1
  echo "[PASS] Task 2: '3.14159' found in output."
else:
  echo "[FAIL] Task 2: '3.14159' not found in output."

# Task 3: Check if there's a sum. This is a bit naive.
# A more robust check would require the exercise to print "Sum: <value>"
# For now, we'll just check if there's any line that looks like a number (could be the sum).
var foundSumLike = false
for line in input.splitLines:
  if line.strip.len > 0 and line.strip.allCharsInSet(Digits):
    foundSumLike = true
    break
if foundSumLike:
  checksPassed += 1
  echo "[PASS] Task 3: A numeric sum-like value found."
else:
  echo "[FAIL] Task 3: No clear numeric sum found. Ensure you print the sum."

# Task 4: Check for "Nim is awesome"
if "Nim is awesome" in input:
  checksPassed += 1
  echo "[PASS] Task 4: 'Nim is awesome' found."
else:
  echo "[FAIL] Task 4: 'Nim is awesome' not found."


if checksPassed == totalChecks:
  echo "All validation checks passed!"
  quit(0) # Success
else:
  echo checksPassed, " out of ", totalChecks, " checks passed."
  quit(1) # Failure
