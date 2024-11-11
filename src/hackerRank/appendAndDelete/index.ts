function appendAndDelete(s, t, k) {
  // Initialize a counter for the minimum operations needed
  let minOperations = 0;

  // We will modify the string `s` to match `t`
  let currentString = s;

  // Find the position where both strings differ
  let i = 0;
  while (i < currentString.length) {
    if (currentString[i] === t[i]) {
      // Characters match, move to the next character
      i++;
      continue;
    }

    // If characters don't match, we delete from `s` at position `i`
    currentString = currentString.substring(0, i) + currentString.substring(i + 1);
    minOperations++;
  }

  // Account for the remaining characters in `t` (insertions)
  minOperations += t.length - currentString.length;

  // If the total number of operations exceeds `k`, return "No"
  if (minOperations > k) {
    return "No";
  }

  // Check if the remaining steps after the conversion can be evenly distributed
  let remainingSteps = k - minOperations;
  if (currentString.length > remainingSteps / 2 && remainingSteps % 2 === 1) {
    return "No";
  }

  // If we've successfully transformed `s` into `t` within `k` operations, return "Yes"
  return "Yes";
}
