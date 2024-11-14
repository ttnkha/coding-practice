function findSubstring(s: string, words: string[]): number[] {
  // If no words are given, return an empty array
  if (!words.length) {
    return [];
  }

  // Check if all words in the list are identical, if so, we can treat them as a single word
  let isAllWordsSame = true;
  for (let i = 0; i < words.length - 1; i++) {
    if (words[i] !== words[i + 1]) {
      isAllWordsSame = false;
    }
  }

  // If all words are the same, we combine them into a single word
  if (isAllWordsSame) {
    words = [words.join("")];
  }

  const wordLength = words[0].length; // Length of each word
  const totalLength = wordLength * words.length; // Total length of the concatenated words
  let result: number[] = []; // To store the starting indices of valid substrings
  let i = 0;

  // Loop through the string `s` and check if we can form a valid substring
  while (i <= s.length - totalLength) {
    const word = s.substring(i, i + wordLength); // Get the word at the current position
    let wordIndex = words.findIndex((w) => w === word); // Find index of this word in the list
    const remainingWords = [...words]; // Copy the list of words and check for a valid concatenation
    let j = i;

    // Try to find the subsequent words in the string
    while (remainingWords.length && wordIndex > -1) {
      remainingWords.splice(wordIndex, 1); // Remove the word from the list
      if (!remainingWords.length) {
        result.push(i); // All words matched, add the starting index to the result
      }
      j += wordLength; // Move the index to the next word position
      wordIndex = remainingWords.findIndex((w) => w === s.substring(j, j + wordLength)); // Find the next word
    }

    i++;
  }

  return result; // Return the result array containing starting indices
}
