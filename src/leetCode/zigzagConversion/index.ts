function convert(s: string, numRows: number): string {
  if (numRows === 1) {
    return s; // No zigzagging needed if there's only one row
  }

  let zigzagRows = new Array(numRows).fill(""); // Create an array for each row
  let currentIndex = 0;
  let currentRow = 0;
  let isGoingDown = true;

  // Iterate through the characters of the string
  while (currentIndex < s.length) {
    zigzagRows[currentRow] += s[currentIndex];
    currentIndex++;

    // Check if we're at the top or bottom of the zigzag pattern
    isGoingDown = (isGoingDown && currentRow !== numRows - 1) || (!isGoingDown && currentRow === 0);

    // Move up or down the rows based on the direction
    currentRow = currentRow + (isGoingDown ? 1 : -1);
  }

  // Join all rows to form the final result
  return zigzagRows.join("");
}
