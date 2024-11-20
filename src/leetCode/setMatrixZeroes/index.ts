/**
 * Sets entire rows and columns to 0 in a matrix where a 0 is found.
 *
 * This function modifies the matrix in-place and does not return anything.
 * It first identifies the positions of all 0s in the matrix, then sets the
 * corresponding rows and columns to 0.
 *
 * @param matrix - A 2D array representing the matrix to be modified.
 */
function setZeroes(matrix: number[][]): void {
  const m = matrix.length; // Number of rows in the matrix
  const n = matrix[0].length; // Number of columns in the matrix
  const zeroRows: number[] = []; // Array to track rows that should be set to 0
  const zeroCols: number[] = []; // Array to track columns that should be set to 0

  // Identify rows and columns that contain 0
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      if (matrix[i][j] === 0) {
        zeroRows.push(i); // Add row index to zeroRows array
        zeroCols.push(j); // Add column index to zeroCols array
      }
    }
  }

  // Set the identified rows and columns to 0
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      if (zeroRows.includes(i) || zeroCols.includes(j)) {
        matrix[i][j] = 0;
      }
    }
  }
}
