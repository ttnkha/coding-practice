/**
 * Groups anagrams from a list of strings.
 * Anagrams are words that contain the same characters in any order.
 *
 * @param strs An array of strings to be grouped.
 * @returns A 2D array where each sub-array contains words that are anagrams of each other.
 */
function groupAnagrams(strs: string[]): string[][] {
  // Create a map where the key is the sorted string, and the value is an array of anagrams
  const anagramMap: Record<string, string[]> = {};

  // Iterate through the input strings to populate the map.
  for (const str of strs) {
    // Generate a unique key by sorting the characters of the string.
    const sortedStr = str.split("").sort().join("");

    // If the key does not exist in the map, initialize it with an empty array.
    if (!anagramMap[sortedStr]) {
      anagramMap[sortedStr] = [];
    }

    // Push the current string to the corresponding anagram group.
    anagramMap[sortedStr].push(str);
  }

  // Return the grouped anagrams by extracting the values from the map.
  return Object.values(anagramMap);
}
