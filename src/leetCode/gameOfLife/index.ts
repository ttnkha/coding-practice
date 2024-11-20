/**
 * Updates the board based on the rules of Conway's Game of Life.
 *
 * This function modifies the board in-place and does not return anything.
 * It computes the next state of the board based on the current state and the number of live neighbors.
 *
 * Rules:
 * - A live cell (1) with fewer than two live neighbors dies (underpopulation).
 * - A live cell (1) with more than three live neighbors dies (overpopulation).
 * - A dead cell (0) with exactly three live neighbors becomes alive (reproduction).
 *
 * @param board - A 2D array representing the current state of the board.
 */
function gameOfLife(board: number[][]): void {
  const adjacents = [
    [-1, 0],
    [1, 0],
    [0, 1],
    [0, -1],
    [1, 1],
    [1, -1],
    [-1, 1],
    [-1, -1],
  ]; // All 8 possible directions around a cell

  let changedCells: number[][] = []; // Array to track cells that need to be toggled

  // Loop through the board to determine the next state of each cell
  for (let i = 0; i < board.length; i++) {
    for (let j = 0; j < board[i].length; j++) {
      const liveCount = adjacents
        .map((adj) => {
          const row = adj[0] + i;
          const col = adj[1] + j;
          return board[row]?.[col]; // Get the value of adjacent cells
        })
        .filter((val) => val).length; // Count how many neighbors are live

      // Apply Game of Life rules:
      // Cell becomes alive if it is dead and has exactly 3 live neighbors
      if (liveCount === 3 && !board[i][j]) {
        changedCells.push([i, j]);
      }
      // Cell dies if it is alive but has fewer than 2 or more than 3 live neighbors
      if ((liveCount < 2 || liveCount > 3) && board[i][j]) {
        changedCells.push([i, j]);
      }
    }
  }

  // Update the board with the new state (toggle the cells in changedCells)
  for (const coor of changedCells) {
    board[coor[0]][coor[1]] = Math.abs(board[coor[0]][coor[1]] - 1);
  }
}
