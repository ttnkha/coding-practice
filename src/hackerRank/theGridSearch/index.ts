/**
 * This function finds all occurrences of a given substring (searchStr) within a string (str).
 * It returns an array of the starting indices where the substring appears.
 *
 * @param str - The string to search within.
 * @param searchStr - The substring to search for.
 * @returns An array of indices where the substring is found.
 */
function findSubstringOccurrences(str: string, searchStr: string): number[] {
  let result: number[] = [];
  let existsIndex = str.indexOf(searchStr);

  // Return an empty array if the substring is not found
  if (existsIndex === -1) {
    return [];
  }

  // Keep searching for occurrences while they exist in the string
  while (existsIndex > -1 && existsIndex < str.length - searchStr.length) {
    result.push(existsIndex);
    existsIndex = str.indexOf(searchStr, existsIndex + 1);
  }

  // Add the last occurrence if it's still found after the loop
  if (existsIndex !== -1) {
    result.push(existsIndex);
  }

  return result;
}

/**
 * This function searches for a pattern P in a grid of strings G.
 * It checks if the entire pattern P exists as a contiguous block within the grid G.
 *
 * @param G - A 2D array of strings representing the grid.
 * @param P - A 2D array of strings representing the pattern to search for.
 * @returns A string: "YES" if the pattern is found, otherwise "NO".
 */
function gridSearch(G: string[], P: string[]): string {
  let i = 0;

  // Iterate through each row of the grid G
  while (i < G.length) {
    let j = 0;

    // Find the starting positions of the pattern in the current row (G[i])
    let existsIdxes = findSubstringOccurrences(G[i], P[j]);

    // If no starting index found, move to the next row
    if (!existsIdxes.length) {
      i++;
      continue;
    }

    // Iterate through the rest of the pattern P, row by row
    while (j < P.length - 1) {
      j++;

      // Find the starting indices of the next row of the pattern (P[j]) in the corresponding row of the grid
      let nextExistsIdxes = findSubstringOccurrences(G[i + j], P[j]);

      // If no match is found in the current row, break the loop
      if (!nextExistsIdxes.length) {
        existsIdxes = [];
        break;
      }

      // Intersect the existing matches with the new ones to find common starting indices
      existsIdxes = existsIdxes.filter((number) => nextExistsIdxes.includes(number));

      // If no common indices, the pattern doesn't exist, break out of the loop
      if (!existsIdxes.length) {
        break;
      }
    }

    // If the entire pattern was found, return "YES"
    if (j === P.length - 1 && existsIdxes.length) {
      return "YES";
    }

    // Move to the next row in the grid
    i++;
  }

  // If the pattern wasn't found in any part of the grid, return "NO"
  return "NO";
}
