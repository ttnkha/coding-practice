/**
 * This function takes a matrix and returns the elements in spiral order.
 * It starts from the top-left corner and proceeds to the right, down, left, and up, in a spiral pattern,
 * until all elements of the matrix have been added to the result array.
 *
 * @param matrix - A 2D array representing the matrix to traverse.
 * @returns A 1D array containing the elements of the matrix in spiral order.
 */
function spiralOrder(matrix: number[][]): number[] {
  const m = matrix.length; // Number of rows in the matrix
  const n = matrix[0].length; // Number of columns in the matrix

  let result: number[] = []; // To store the result in spiral order
  let top = 0; // Start of the row
  let left = 0; // Start of the column
  let bottom = m - 1; // End of the row
  let right = n - 1; // End of the column

  // Traverse the matrix in a spiral order
  while (top <= bottom && left <= right) {
    // Traverse from left to right along the top row
    for (let i = left; i <= right; i++) {
      result.push(matrix[top][i]);
    }
    top++; // Move down to the next row

    // Traverse from top to bottom along the right column
    for (let i = top; i <= bottom; i++) {
      result.push(matrix[i][right]);
    }
    right--; // Move left to the next column

    if (top <= bottom) {
      // Traverse from right to left along the bottom row
      for (let i = right; i >= left; i--) {
        result.push(matrix[bottom][i]);
      }
      bottom--; // Move up to the next row
    }

    if (left <= right) {
      // Traverse from bottom to top along the left column
      for (let i = bottom; i >= top; i--) {
        result.push(matrix[i][left]);
      }
      left++; // Move right to the next column
    }
  }

  return result;
}
