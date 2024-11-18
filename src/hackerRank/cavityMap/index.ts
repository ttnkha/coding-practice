/**
 * This function processes a grid of integers (represented as a 2D matrix of strings) to find all "cavity" cells,
 * where a "cavity" is defined as a cell that is not on the border and has a greater depth than all its adjacent cells.
 * The depth values of the cavities are replaced by the character 'X'.
 *
 * @param grid - A 2D grid of strings representing depth values (e.g., ["123", "456", "789"]).
 * @returns A new grid where cavities are replaced by 'X'.
 */
function cavityMap(grid: string[]): string[] {
  // Array to hold the final grid after processing
  let result: string[] = [];

  // Set to track already replaced cavity indexes to avoid multiple replacements
  let replacedIndexes: string[] = [];

  // Iterate through each row of the grid
  for (let row = 0; row < grid.length; row++) {
    // Skip the first and last row, as they cannot be cavities (border cells)
    if (row === 0 || row === grid.length - 1) {
      result.push(grid[row]);
      continue;
    }

    // Initialize an empty string to construct the modified row
    let modifiedRow: string = "";

    // Iterate through each column in the current row (excluding border columns)
    for (let col = 0; col < grid.length; col++) {
      // Skip the first and last column (border columns cannot be cavities)
      if (col === 0 || col === grid.length - 1) {
        modifiedRow += grid[row][col];
        continue;
      }

      // Define the relative positions of the 4 adjacent cells (up, down, left, right)
      const adjacentCells = [
        [-1, 0],
        [1, 0],
        [0, 1],
        [0, -1],
      ];

      // Check if the current cell is a cavity by comparing it to its adjacent cells
      const isCavity = adjacentCells.every((offset) => {
        const adjRow = row + offset[0];
        const adjCol = col + offset[1];

        // Check if the adjacent cell has a greater or equal depth or has already been replaced
        const adjacentValue = grid[adjRow][adjCol];
        return (
          !replacedIndexes.includes(`${adjRow}_${adjCol}`) &&
          Number(adjacentValue) < Number(grid[row][col])
        );
      });

      // If the current cell is a cavity, replace it with 'X', otherwise keep the original value
      if (isCavity) {
        modifiedRow += "X";
        // Keep track of the replaced index
        replacedIndexes.push(`${row}_${col}`);
      } else {
        modifiedRow += grid[row][col];
      }
    }

    // Push the modified row into the result grid
    result.push(modifiedRow);
  }

  // Return the new grid with cavities replaced by 'X'
  return result;
}
