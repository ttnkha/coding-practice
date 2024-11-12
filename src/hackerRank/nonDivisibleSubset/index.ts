/**
 * Returns the size of the largest subset of integers where no two elements are divisible by each other.
 * This is achieved by selecting elements from the input array such that no pair of elements' sum is divisible by `k`.
 *
 * @param k - The divisor value used to check the sum of elements.
 * @param arr - The array of integers.
 * @returns The size of the largest subset of integers with the desired property.
 */
function largestNonDivisibleSubset(k: number, arr: number[]): number {
  // A map to store arrays of numbers grouped by their remainder when divided by k
  const remainderGroups: Record<number, number[]> = {};

  // Group numbers based on their remainder when divided by k
  for (const num of arr) {
    const remainder = num % k;
    if (!remainderGroups[remainder]) {
      remainderGroups[remainder] = [];
    }
    remainderGroups[remainder].push(num);
  }

  // Variable to track the maximum subset size
  let maxSubsetSize = 0;

  // If there are numbers with remainder 0, we can only include at most one of them
  if (remainderGroups[0]) {
    maxSubsetSize++;
  }

  // If k is even, we can only include one element with remainder k/2
  if (k % 2 === 0 && remainderGroups[k / 2]) {
    maxSubsetSize++;
  }

  // For remainders 1 to k/2 - 1, we select the larger group between `remainder` and `k - remainder`
  for (let remainder = 1; remainder < k / 2; remainder++) {
    const complementRemainder = k - remainder;
    // Choose the larger group between current remainder and its complement (k - remainder)
    maxSubsetSize += Math.max(
      remainderGroups[remainder]?.length ?? 0,
      remainderGroups[complementRemainder]?.length ?? 0
    );
  }

  return maxSubsetSize;
}
