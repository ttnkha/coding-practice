/**
 * Performs binary search to find if a number exists in a sorted array.
 * @param {number[]} sortedArray - The sorted array of numbers.
 * @param {number} leftIndex - The left index of the search range.
 * @param {number} target - The number to search for.
 * @returns {boolean} - Returns true if the target is found in the array, otherwise false.
 */
function binarySearch(sortedArray: number[], leftIndex: number, target: number): boolean {
  let rightIndex = sortedArray.length - 1;

  while (leftIndex <= rightIndex) {
    const midIndex = Math.floor((leftIndex + rightIndex) / 2);

    if (sortedArray[midIndex] === target) {
      return true;
    }

    if (sortedArray[midIndex] < target) {
      leftIndex = midIndex + 1;
    } else {
      rightIndex = midIndex - 1;
    }
  }

  return false; // Only return true if target is found in the remaining search range.
}

/**
 * Finds all unique triplets in the array that sum up to zero.
 * @param {number[]} nums - An array of numbers to search for triplets.
 * @returns {number[][]} - An array of arrays, each containing a triplet that sums to zero.
 */
function threeSum(nums: number[]): number[][] {
  // Sort the array in ascending order for easier triplet detection
  const sortedArray = nums.sort((a, b) => a - b);

  // If the smallest element is greater than zero or the largest element is less than zero,
  // no triplet can sum to zero, so return an empty array early.
  if (sortedArray[0] > 0 || sortedArray[sortedArray.length - 1] < 0) {
    return [];
  }

  let triplets: number[][] = [];

  for (let i = 0; i < sortedArray.length - 2; i++) {
    // Skip duplicate elements to avoid repeating triplets
    if (i > 0 && sortedArray[i] === sortedArray[i - 1]) {
      continue;
    }

    // For each number in the sorted array, try to find a pair that sums to the negation of the current number
    for (let j = i + 1; j < sortedArray.length - 1; j++) {
      // Skip duplicates of the second number to avoid repeating triplets
      if (j > i + 1 && sortedArray[j] === sortedArray[j - 1]) {
        continue;
      }

      const sumOfTwo = sortedArray[i] + sortedArray[j];
      const opposite = -sumOfTwo; // We need the opposite number to make the sum zero.

      // Use binary search to check if the opposite number exists in the remaining array.
      if (opposite >= sortedArray[j] && binarySearch(sortedArray, j + 1, opposite)) {
        triplets.push([sortedArray[i], sortedArray[j], opposite]);
      }
    }
  }

  return triplets;
}
