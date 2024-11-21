/**
 * Checks if a given string `s` follows the pattern described by the string `pattern`.
 * The function checks whether each character in `pattern` corresponds to a unique word in `s`
 * and whether the mapping is consistent across the entire string.
 *
 * @param pattern A string representing a pattern of characters.
 * @param s A string containing words that should follow the pattern.
 * @returns True if the words in `s` match the pattern, otherwise false.
 */
function wordPattern(pattern: string, s: string): boolean {
  // Split the string into an array of words.
  const words = s.split(" ");

  // If the number of words does not match the length of the pattern, return false.
  if (words.length !== pattern.length) {
    return false;
  }

  // The number of words and the pattern length (same at this point).
  const n = words.length;

  // Maps to track the mappings between characters in pattern and words in the string.
  let patternMap: Record<string, number> = {};
  let wordMap: Record<string, number> = {};

  // Counters to assign unique numbers to characters and words.
  let patternCount = 0;
  let wordCount = 0;

  // Iterate through each character in the pattern and corresponding word in the string.
  for (let i = 0; i < n; i++) {
    const patternChar = pattern[i]; // Character from the pattern.
    const word = words[i]; // Word from the string.

    // If the character in the pattern has not been mapped yet, assign it a unique number.
    if (!patternMap[patternChar]) {
      patternCount++;
      patternMap[patternChar] = patternCount;
    }

    // If the word has not been mapped yet, assign it a unique number.
    // Added check to ensure it's not already mapped as a non-number.
    if (!wordMap[word] || typeof wordMap[word] !== "number") {
      wordCount++;
      wordMap[word] = wordCount;
    }

    // If the mappings do not match, the pattern is not followed correctly.
    if (patternMap[patternChar] !== wordMap[word]) {
      return false;
    }
  }

  // If all checks pass, the string follows the pattern.
  return true;
}
