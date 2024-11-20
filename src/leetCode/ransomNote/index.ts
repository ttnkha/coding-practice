/**
 * This function checks if it is possible to construct the ransom note using
 * characters from the given magazine string. Each character in the ransom note
 * must appear in the magazine string at least as many times as it does in the note.
 *
 * @param ransomNote - The string representing the ransom note we want to construct.
 * @param magazine - The string representing the magazine containing characters we can use.
 *
 * @returns boolean - Returns true if the ransom note can be constructed, false otherwise.
 */
function canConstruct(ransomNote: string, magazine: string): boolean {
  // Convert the magazine string into an array of characters for easier manipulation
  const arr = magazine.split("");

  // Loop through each character in the ransom note
  for (const char of ransomNote) {
    // Find the index of the character in the magazine array
    const existsIdx = arr.indexOf(char);

    // If the character is not found, we cannot construct the ransom note
    if (existsIdx === -1) {
      return false;
    }

    // Replace the found character with a placeholder to prevent reusing the same character
    arr[existsIdx] = "A";
  }

  // If all characters in the ransom note are found, return true
  return true;
}
