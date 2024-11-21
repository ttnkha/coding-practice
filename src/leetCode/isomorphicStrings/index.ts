/**
 * Checks if two strings are isomorphic.
 * Two strings are isomorphic if there is a one-to-one mapping between every character in the first string to a character in the second string,
 * such that the mapping is consistent throughout the strings.
 *
 * @param s The first string to check.
 * @param t The second string to check.
 * @returns True if the strings are isomorphic, otherwise false.
 */
function isIsomorphic(s: string, t: string): boolean {
  // If the strings have different lengths, they cannot be isomorphic.
  if (s.length !== t.length) {
    return false;
  }

  // The length of the strings (both are the same at this point).
  const n = s.length;

  // Maps to track the character mappings for each string.
  let sToTMapping: Record<string, number> = {};
  let tToSMapping: Record<string, number> = {};

  // Counters to assign unique numbers to each character in both strings.
  let sCharCount = 0;
  let tCharCount = 0;

  // Traverse through both strings.
  for (let i = 0; i < n; i++) {
    // If the character in `s` has not been seen before, assign it a unique number.
    if (!sToTMapping[s[i]]) {
      sCharCount++;
      sToTMapping[s[i]] = sCharCount;
    }

    // If the character in `t` has not been seen before, assign it a unique number.
    if (!tToSMapping[t[i]]) {
      tCharCount++;
      tToSMapping[t[i]] = tCharCount;
    }

    // If the current mapping doesn't match, the strings are not isomorphic.
    if (sToTMapping[s[i]] !== tToSMapping[t[i]]) {
      return false;
    }
  }

  // If all checks pass, the strings are isomorphic.
  return true;
}
