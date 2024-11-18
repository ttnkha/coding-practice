/**
 * This function checks if a given 9x9 Sudoku board is valid.
 * The board is valid if:
 * 1. Each row contains no duplicate digits (except for '.' representing empty cells).
 * 2. Each column contains no duplicate digits (except for '.').
 * 3. Each 3x3 sub-grid (box) contains no duplicate digits (except for '.').
 *
 * @param board - A 2D array representing a Sudoku board.
 * @returns A boolean indicating whether the board is valid.
 */
function isValidSudoku(board: string[][]): boolean {
  // Store numbers seen in each 3x3 sub-grid (box)
  let subGridSeenNumbers: Record<number, string> = { 0: "", 1: "", 2: "" };

  // Iterate over rows of the board
  for (let i = 0; i < board.length; i++) {
    // Reset the sub-grid tracking for each new set of rows (every 3 rows)
    if (i % 3 === 0) {
      subGridSeenNumbers = { 0: "", 1: "", 2: "" };
    }

    // Track numbers seen in the current row and column
    let seenInRow = "";
    let seenInColumn = "";

    // Iterate over columns of the current row
    for (let j = 0; j < board.length; j++) {
      // Check for duplicates in row, column, or 3x3 sub-grid
      if (
        seenInRow.includes(board[i][j]) ||
        seenInColumn.includes(board[j][i]) ||
        subGridSeenNumbers[Math.floor(j / 3)].includes(board[i][j])
      ) {
        return false; // Invalid board if any duplicate is found
      }

      // If the current cell is not empty, add to the respective tracking strings
      if (board[i][j] !== ".") {
        seenInRow += board[i][j]; // Add to row tracker
        subGridSeenNumbers[Math.floor(j / 3)] += board[i][j]; // Add to sub-grid tracker
      }

      if (board[j][i] !== ".") {
        seenInColumn += board[j][i]; // Add to column tracker
      }
    }
  }

  // Return true if no duplicates were found
  return true;
}
