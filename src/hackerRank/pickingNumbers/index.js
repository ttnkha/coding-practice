/**
 * Given an array of integers, find the longest subarray where the absolute difference
 * between any two elements is less than or equal to 1.
 *
 * @param {number[]} a - An array of integers from which to select numbers.
 * @returns {number} The maximum count of integers that can be selected
 *                   under the given condition.
 *
 * The function uses a frequency map to count occurrences of pairs of
 * numbers (n and n+1) and then returns the highest count of any pair.
 *
 * Example:
 *
 *   const numbers = [4, 6, 5, 3, 3, 1];
 *   const result = pickingNumbers(numbers); // returns 3, from the selection [4, 3, 3]
 */
function pickingNumbers(a) {
  let map = {};
  let max = 0;

  for (const number of a) {
    const predecessor = `${number - 1}${number}`; // Key for number and its predecessor
    map[predecessor] = (map[predecessor] ?? 0) + 1; // Count occurrences
    const successor = `${number}${number + 1}`; // Key for number and its successor
    map[successor] = (map[successor] ?? 0) + 1; // Count occurrences

    max = Math.max(max, map[predecessor], map[successor]); // Update max count
  }

  return max; // Return the maximum count found
}
