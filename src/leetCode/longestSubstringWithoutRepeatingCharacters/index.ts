/**
 * Returns the length of the longest substring without repeating characters.
 *
 * @param s - The input string to analyze.
 * @returns The length of the longest substring that does not contain repeating characters.
 */
function lengthOfLongestSubstring(s: string): number {
  let longestSubstringLength = 0; // To store the length of the longest substring found.
  let currentSubstring: string[] = []; // Array to store characters of the current substring.
  let currentIndex = 0; // Pointer to iterate through the string.

  // Iterate over the string to find substrings without repeating characters.
  while (currentIndex < s.length) {
    const currentChar = s[currentIndex]; // Current character at position `currentIndex`.

    // Find the index of the current character in the current substring.
    const existingCharIndex = currentSubstring.findIndex((char) => char === currentChar);

    // If the character is not found in the current substring, it's unique.
    if (existingCharIndex === -1) {
      currentSubstring.push(currentChar); // Add the character to the substring.
      currentIndex++; // Move to the next character in the string.
      continue;
    }

    // Update the longestSubstringLength if the current substring is longer.
    longestSubstringLength = Math.max(longestSubstringLength, currentSubstring.length);

    // Remove characters up to and including the first occurrence of the repeated character.
    currentSubstring = currentSubstring.slice(existingCharIndex + 1);
    currentSubstring.push(currentChar); // Add the current character to the substring.
    currentIndex++; // Move to the next character in the string.
  }

  // Ensure the longest substring length is updated after the loop ends.
  return Math.max(longestSubstringLength, currentSubstring.length);
}
