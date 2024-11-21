function absolutePermutation(n, k) {
  // If k = 0, the permutation is the array itself
  if (k === 0) {
    return Array.from({ length: n }, (_, i) => i + 1);
  }

  // If n is not divisible by 2 * k, it's impossible to create a valid permutation
  // because the array must be split into pairs of size k for the permutation to work
  if (n % (2 * k) !== 0) {
    return [-1]; // Return -1 if it's not possible to form a valid permutation
  }

  // Create an empty array to store the result permutation
  let result = new Array(n);

  // Iterate through the array and swap elements in pairs
  for (let i = 0; i < n; i++) {
    // We determine whether to swap the elements by checking if the current index
    // is in an "even" or "odd" block. Every 2 * k elements we swap.
    // If i is in the first half of the block, swap with i + k
    // If i is in the second half, swap with i - k
    if (Math.floor(i / k) % 2 === 0) {
      result[i] = i + k + 1; // Swap with the element k steps ahead
    } else {
      result[i] = i - k + 1; // Swap with the element k steps behind
    }
  }

  // Return the result as the final permutation
  return result;
}

console.log(absolutePermutation(10, 1)); // Output: [2, 1, 4, 3, 6, 5, 8, 7, 10, 9]
