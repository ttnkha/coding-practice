/**
 * Finds the maximum distance from any city to the nearest space station.
 *
 * @param totalCities - The total number of cities.
 * @param spaceStations - An array containing the positions of the space stations.
 * @returns The maximum distance from any city to the closest space station.
 */
function flatlandSpaceStations(totalCities, spaceStations) {
  // Sort the array of space station positions in ascending order
  const sorted = spaceStations.sort((a, b) => a - b);
  let j = 0; // Index for the current space station being considered
  let max = 0; // Variable to track the maximum distance found

  // Iterate through each city to calculate distances
  for (let i = 0; i < totalCities; i++) {
    // Move to the next space station if the next station is closer
    if (j < sorted.length - 1 && sorted[j + 1] - i <= i - sorted[j]) {
      j++;
    }
    // Calculate and update the maximum distance to the nearest space station
    max = Math.max(max, Math.abs(i - sorted[j]));
  }

  return max; // Return the max distance found
}
