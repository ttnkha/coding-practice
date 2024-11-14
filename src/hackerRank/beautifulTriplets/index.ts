/**
 * Counts the number of beautiful triplets in the given array.
 * A triplet is considered beautiful if for indices (i, j, k) with i < j < k:
 *   arr[j] - arr[i] = d and arr[k] - arr[j] = d
 *
 * @param d The difference between consecutive elements in the triplet.
 * @param arr The array of integers where we need to find beautiful triplets.
 * @returns The count of beautiful triplets in the array.
 */
function beautifulTriplets(d: number, arr: number[]): number {
  let tripletCount = 0; // Variable to store the number of beautiful triplets
  let frequencyMap: Record<number, number> = {}; // Map to store the frequency of elements in the array

  // Populate the frequency map with the count of each number in the array
  for (const num of arr) {
    frequencyMap[num] = (frequencyMap[num] ?? 0) + 1;
  }

  // Iterate through the array to check for each element if it can form a triplet
  for (let i = 1; i < arr.length - 1; i++) {
    const currentNum = arr[i];

    // Skip if the current number is the same as the previous number (to avoid duplicates)
    if (currentNum === arr[i - 1]) {
      continue;
    }

    // Calculate the potential other elements in the triplet
    const nextElement = currentNum + d; // This would be the arr[k]
    const prevElement = currentNum - d; // This would be the arr[i]

    // Check if the required elements exist in the map and the conditions hold for a triplet
    if (
      frequencyMap[nextElement] &&
      frequencyMap[prevElement] &&
      (currentNum !== prevElement || frequencyMap[currentNum] > 1)
    ) {
      tripletCount += Math.max(frequencyMap[nextElement], frequencyMap[prevElement]);
    }
  }
  
  return tripletCount; // Return the total count of beautiful triplets
}
