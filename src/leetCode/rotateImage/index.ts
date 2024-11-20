/**
 * Rotates a square matrix 90 degrees clockwise in-place.
 *
 * This function modifies the matrix directly and does not return any value.
 * The rotation is done in layers, starting from the outermost layer and working inward.
 *
 * @param matrix - A 2D array representing a square matrix to be rotated.
 */
function rotate(matrix: number[][]): void {
  let start = 0; // Start index for the current layer
  let end = matrix.length - 1; // End index for the current layer

  // Rotate matrix layer by layer
  while (start < end) {
    for (let i = start; i < end; i++) {
      // Store the value temporarily for the rotation
      let tmp = matrix[start][end - i + start];

      // Rotate four elements in the current layer
      matrix[start][end - i + start] = matrix[i][start];
      matrix[i][start] = matrix[end][i];
      matrix[end][i] = matrix[end - i + start][end];
      matrix[end - i + start][end] = tmp;
    }
    start++; // Move to the next layer
    end--; // Move to the previous layer
  }
}
