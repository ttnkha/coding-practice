/**
 * Returns the number of times the letter 'a' appears in the first `n` characters of a repeated string.
 *
 * @param s - The input string, which is repeated infinitely.
 * @param n - The number of characters to consider from the repeated string.
 * @returns The total number of occurrences of the letter 'a' in the first `n` characters.
 */
function repeatedString(s: string, n: number): number {
  const stringLength = s.length; // Length of the input string
  const fullRepeats = Math.floor(n / stringLength); // Number of complete repetitions of the string within `n`
  const remainingChars = n % stringLength; // Number of characters remaining after the full repetitions

  // Array to store the indices of 'a' in the original string `s`
  const aIndices: number[] = [];
  let additionalA = 0; // Count of 'a's in the remaining characters after full repetitions

  // Loop through the string and collect indices of 'a', counting occurrences in the remaining part
  for (let i = 0; i < stringLength; i++) {
    if (s[i] === "a") {
      aIndices.push(i);
      if (remainingChars > 0 && i < remainingChars) {
        additionalA++; // Count 'a's in the remaining substring
      }
    }
  }

  // The total occurrences of 'a' is the number in the full repetitions + those in the remaining substring
  return fullRepeats * aIndices.length + additionalA;
}
