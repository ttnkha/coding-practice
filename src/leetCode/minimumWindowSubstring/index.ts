/**
 * Finds the minimum window in string `s` that contains all characters of string `t`.
 * This function uses the sliding window technique with a frequency map to track the characters in `t`.
 * It returns the smallest substring of `s` that contains all the characters of `t`.
 *
 * @param s - The string in which we are searching for the minimum window.
 * @param t - The string whose characters must appear in the minimum window of `s`.
 * @returns The smallest substring of `s` that contains all characters of `t`. If no such window exists, returns an empty string.
 */
function minWindow(s: string, t: string): string {
  // Frequency map to count occurrences of each character in string t
  let frequencyMap: number[] = new Array(128).fill(0);

  // Populate the frequency map with the count of each character in t
  for (const char of t) {
    frequencyMap[char.charCodeAt(0)]++;
  }

  let requiredCharsCount = t.length; // Number of characters that need to be matched
  let windowStart = 0; // Left pointer of the sliding window
  let windowEnd = 0; // Right pointer of the sliding window
  let minWindowLength = Infinity; // To track the length of the smallest valid window
  let windowStartIndex = 0; // To track the start index of the smallest valid window

  // Expand the window with the 'windowEnd' pointer
  while (windowEnd < s.length) {
    // Get the character code at the 'windowEnd' position in string s
    const currentCharCode = s.charCodeAt(windowEnd);

    // If the current character exists in t, decrease the required character count
    if (frequencyMap[currentCharCode] > 0) {
      requiredCharsCount--;
    }

    // Decrease the frequency of the current character as it's included in the window
    frequencyMap[currentCharCode]--;

    // Move the 'windowEnd' pointer to the next character
    windowEnd++;

    // When all characters of t are found in the current window
    while (requiredCharsCount === 0) {
      // Update the minimum window size and its starting index if this window is smaller
      if (windowEnd - windowStart < minWindowLength) {
        minWindowLength = windowEnd - windowStart;
        windowStartIndex = windowStart;
      }

      // Shrink the window from the left by moving 'windowStart' forward
      const leftCharCode = s.charCodeAt(windowStart);

      // If the character at 'windowStart' was part of the solution, increment the required character count
      if (frequencyMap[leftCharCode] === 0) {
        requiredCharsCount++;
      }

      // Revert the change in frequency for the character at 'windowStart'
      frequencyMap[leftCharCode]++;

      // Move the 'windowStart' pointer forward to shrink the window
      windowStart++;
    }
  }

  // If no valid window was found, return an empty string
  return minWindowLength === Infinity
    ? ""
    : s.substring(windowStartIndex, windowStartIndex + minWindowLength);
}
