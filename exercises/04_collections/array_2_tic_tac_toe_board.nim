# Description: Use an array for a simple, fixed-size structure like a game board.
# Hint: A 2D board can be represented as an array of arrays, e.g., `array[3, array[3, char]]`.
# Or, a 1D array can represent a 3x3 board if you map indices (0-8) to (row, col).
# For simplicity, let's use a 1D array of 9 characters for a Tic-Tac-Toe board.
# SandboxPreference: wasm
# Points: 15

# Task:
# 1. Define an array `board` of 9 characters, initialized with '-' (hyphen) for empty cells.
# 2. Place an 'X' at the center of the board (index 4).
# 3. Place an 'O' at the top-left corner (index 0).
# 4. Write a procedure `printBoard` that takes the board array and prints it in a 3x3 grid.
#    Example row print: echo board[0], " | ", board[1], " | ", board[2]
# 5. Call `printBoard` with your modified board.

# TODO: Define `printBoard` procedure here.
# proc printBoard(b: array[9, char]) = ...

proc main() =
  # TODO: Step 1 - Define and initialize `board`.
  # var board: array[9, char]
  # for i in 0 .. board.high: board[i] = '-' # One way to initialize

  # TODO: Step 2 - Place 'X'.
  # board[...] = 'X'

  # TODO: Step 3 - Place 'O'.
  # board[...] = 'O'

  echo "Board setup or printBoard not implemented." # Placeholder

  # TODO: Step 5 - Call `printBoard`.
  # printBoard(board)


# Do not modify the lines below; they are for testing.
when defined(testMode):
  main()
else:
  main()

# ExpectedOutput: ```
# O | - | -
# - | X | -
# - | - | -
# ```
