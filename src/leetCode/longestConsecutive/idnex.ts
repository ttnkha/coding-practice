/**
 * Finds the length of the longest consecutive sequence in an unsorted array of integers.
 * A consecutive sequence is a sequence of numbers that are in increasing order by 1.
 *
 * @param nums - An array of integers.
 * @returns The length of the longest consecutive sequence.
 */
function longestConsecutive(nums: number[]): number {
  // Edge case: If the array has 0 or 1 elements, the longest sequence is the length of the array itself
  if (nums.length <= 1) {
    return nums.length;
  }

  // Sort the array in ascending order to identify consecutive sequences
  const sortedNums = nums.sort((a, b) => a - b);

  let longestStreak = 1; // To keep track of the longest sequence found
  let currentStreak = 1; // To keep track of the current consecutive sequence

  for (let i = 1; i < sortedNums.length; i++) {
    // Skip duplicate numbers to avoid counting the same element twice
    if (sortedNums[i] === sortedNums[i - 1]) {
      continue;
    }

    // If the current number is not consecutive to the previous one
    if (sortedNums[i] - sortedNums[i - 1] !== 1) {
      // Compare the current streak with the longest streak found so far
      longestStreak = Math.max(currentStreak, longestStreak);
      // Reset the current streak
      currentStreak = 1;
    } else {
      // If the numbers are consecutive, increment the streak
      currentStreak++;
    }
  }

  // Return the longest consecutive streak found
  return Math.max(currentStreak, longestStreak);
}
