/**
 * Calculates the maximum sum of an hourglass in a 2D array.
 *
 * An hourglass in a 2D array consists of values in a specific pattern:
 *     a b c
 *       d
 *     e f g
 * The sum of these values is calculated, and the maximum sum across all possible hourglasses is returned.
 *
 * @param matrix - A 2D array representing the input matrix.
 * @returns The maximum hourglass sum in the matrix.
 */
function getMaxHourglassSum(matrix: number[][]): number {
  const size = 4; // Size of the 3x3 region for the hourglass
  const hourglassPattern = [
    [0, 0],
    [0, 1],
    [0, 2],
    [1, 1],
    [2, 0],
    [2, 1],
    [2, 2],
  ]; // Offsets for hourglass shape
  let maxSum = -Infinity; // Initialize maxSum to a very low number

  // Traverse the matrix to evaluate all possible hourglasses
  for (let row = 0; row < size; row++) {
    for (let col = 0; col < size; col++) {
      // Calculate the sum of the current hourglass
      const currentSum = hourglassPattern.reduce(
        (sum, offset) => sum + matrix[row + offset[0]][col + offset[1]],
        0
      );

      // Update maxSum if the current hourglass sum is larger
      maxSum = Math.max(maxSum, currentSum);
    }
  }

  return maxSum; // Return the maximum hourglass sum found
}
