/**
 * Checks if two strings are anagrams of each other.
 * An anagram is when two strings have the same characters with the same frequencies,
 * but the order of characters may differ.
 *
 * @param s The first string.
 * @param t The second string.
 * @returns True if the strings are anagrams, otherwise false.
 */
function isAnagram(s: string, t: string): boolean {
  // If the lengths are not equal, they cannot be anagrams.
  if (s.length !== t.length) {
    return false;
  }

  // Create maps to count the occurrences of characters in each string.
  let sCharCountMap: Record<string, number> = {};
  for (const char of s) {
    sCharCountMap[char] = (sCharCountMap[char] ?? 0) + 1;
  }

  let tCharCountMap: Record<string, number> = {};
  for (const char of t) {
    tCharCountMap[char] = (tCharCountMap[char] ?? 0) + 1;
  }

  // Compare the character counts between the two strings.
  for (const [char, count] of Object.entries(sCharCountMap)) {
    if (tCharCountMap[char] !== count) {
      return false;
    }
  }

  // If all character counts match, return true (they are anagrams).
  return true;
}
