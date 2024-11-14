/**
 * Given a string, find the next lexicographically greater permutation of the string.
 * If no greater permutation exists, return "no answer".
 *
 * @param word - The input string for which we need to find the next permutation.
 * @returns The next lexicographically greater string, or "no answer" if it doesn't exist.
 */
function biggerIsGreater(word: string): string {
  // Convert the string to an array of character codes (ASCII values)
  const charCodes = word.split("").map((char) => char.charCodeAt(0));

  let stack: number[] = [];
  let i = charCodes.length - 1;

  // Traverse from the right end of the array to find the first character that is smaller than its next character
  while (i >= 0) {
    stack.push(charCodes[i]);
    i--;

    // If a character is smaller than the next one, stop the loop
    if (charCodes[i] < charCodes[i + 1]) {
      break;
    }
  }

  // If no such character is found, it means the string is in descending order and has no next permutation
  if (i < 0) {
    return "no answer";
  }

  // Find the smallest character in the stack that is greater than the character at index i
  const greaterCharIdx = stack.findIndex((code) => code > charCodes[i]);

  // Swap the character at index i with the greater character
  let temp = charCodes[i];
  charCodes[i] = stack[greaterCharIdx];
  stack[greaterCharIdx] = temp;

  // Now, rearrange the remaining characters to get the smallest lexicographical order
  i++;
  while (stack.length) {
    charCodes[i] = stack.shift()!;
    i++;
  }

  // Convert the array of character codes back to a string and return the result
  return String.fromCharCode(...charCodes);
}
