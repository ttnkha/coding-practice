function longestCommonPrefix(strings: string[]): string {
  let commonPrefix = strings[0]; // Track the common prefix
  let currentStringIndex = 1; // Start with the second string

  while (currentStringIndex < strings.length) {
    const currentString = strings[currentStringIndex];
    let charIndex = 0;

    // Compare characters between the current string and the common prefix
    while (charIndex < currentString.length) {
      if (commonPrefix[charIndex] !== currentString[charIndex]) {
        break;
      }
      charIndex++;
    }

    // If there's no common prefix, return an empty string
    if (charIndex === 0) {
      return "";
    }

    // Update the common prefix to match the length of the found prefix
    commonPrefix = commonPrefix.substring(0, charIndex);
    currentStringIndex++;
  }

  return commonPrefix;
}
