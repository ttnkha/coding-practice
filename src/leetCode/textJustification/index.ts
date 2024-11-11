function fullJustify(words: string[], maxWidth: number): string[] {
  // This will hold the final justified lines
  let justifiedLines: string[] = [];
  let i = 0;

  // Iterate over all words in the input array
  while (i < words.length) {
    // Initialize variables for the current line
    let currentLineLength = 0; // Tracks total length of words in current line
    let currentWords: string[] = []; // Holds the words in the current line

    // Try to fit words into the current line without exceeding maxWidth
    while (i < words.length) {
      const wordLength = words[i].length;
      // Check if adding this word would exceed maxWidth or if adding it would cause imbalance
      if (
        currentWords.length > 0 &&
        currentLineLength + wordLength + currentWords.length > maxWidth
      ) {
        break;
      }

      // Add word to current line
      currentWords.push(words[i]);
      currentLineLength += wordLength;
      i++;
    }

    // Calculate how many spaces are needed to make the line maxWidth
    const remainingSpaces = maxWidth - currentLineLength;

    // Case when the current line contains only one word, just pad with spaces
    if (currentWords.length === 1) {
      justifiedLines.push(currentWords[0] + " ".repeat(remainingSpaces));
    }
    // If we are at the last line, just join words with one space and pad remaining spaces at the end
    else if (i === words.length) {
      justifiedLines.push(
        currentWords.join(" ") + " ".repeat(remainingSpaces - (currentWords.length - 1))
      );
    }
    // General case: Distribute spaces as evenly as possible between words
    else {
      const spacesBetweenWords = Math.floor(remainingSpaces / (currentWords.length - 1)); // Evenly distribute spaces
      let extraSpaces = remainingSpaces % (currentWords.length - 1); // Distribute any leftover spaces

      let line = "";
      let j = 0;

      // Distribute the spaces between words
      while (j < currentWords.length - 1) {
        line += currentWords[j] + " ".repeat(spacesBetweenWords + (extraSpaces > 0 ? 1 : 0));
        j++;
        if (extraSpaces > 0) extraSpaces--; // Decrease extraSpaces after distributing
      }

      // Add the last word without extra space after it
      line += currentWords[j];
      justifiedLines.push(line);
    }
  }

  return justifiedLines;
}
