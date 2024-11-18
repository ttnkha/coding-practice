/**
 * Distributes bread fairly among people to ensure everyone has an even
 * amount by making minimum adjustments.
 *
 * @param breadDistribution - An array representing the number of loaves of
 *                           bread each person has.
 * @returns The total number of loaves added if fair distribution is possible,
 *          or "NO" if it's impossible to achieve fair distribution.
 */
function fairRations(breadDistribution) {
  let count = 0; // Counter for total loaves added
  let i = 0; // Index for iterating through the breadDistribution array

  // Iterate through the array to balance the distribution
  while (i < breadDistribution.length - 1) {
    // If the current person's loaves are odd, give one to them and the next person
    if (breadDistribution[i] % 2 !== 0) {
      breadDistribution[i]++; // Add a loaf to the current person
      breadDistribution[i + 1]++; // Add a loaf to the next person
      count += 2; // Increment count by 2 for the loaves added
    }
    i++; // Move to the next person
  }

  // Check if the last person's loaves are even
  if (breadDistribution[i] % 2 !== 0) {
    return "NO"; // Return "NO" if fair distribution is impossible
  }

  return count; // Return the total number of loaves added
}
