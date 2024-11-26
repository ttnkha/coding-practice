/**
 * Determines the minimum number of arrows required to burst all the balloons.
 * Each balloon is represented by a pair of integers [xStart, xEnd] indicating the
 * horizontal coordinates of the balloon's range on the x-axis.
 * The goal is to find the minimum number of arrows that can burst all balloons
 * by shooting arrows along the x-axis, where each arrow can burst all balloons
 * that overlap with its path.
 *
 * @param balloons - An array of balloon intervals, where each interval is represented
 *                   by a two-element array [start, end], with the start and end positions
 *                   of the balloon on the x-axis.
 * @returns The minimum number of arrows needed to burst all balloons.
 */
function findMinArrowShots(balloons: number[][]): number {
  // Sort the balloons by their start positions (xStart).
  const sortedBalloons = balloons.sort((a, b) => a[0] - b[0]);

  let arrowCount = 0; // Counter for the minimum number of arrows.
  let startBurst = sortedBalloons[0][0]; // The starting point of the first burst (arrow).
  let endBurst = sortedBalloons[0][1]; // The end point of the first burst (arrow).

  // Loop through all the balloons to determine if a new arrow is needed.
  for (let i = 1; i < sortedBalloons.length; i++) {
    const balloon = sortedBalloons[i];

    // Update the start and end burst points based on the current balloon's position.
    startBurst = Math.max(balloon[0], startBurst);
    endBurst = Math.min(balloon[1], endBurst);

    // If the current balloon is not covered by the current arrow, shoot a new one.
    if (startBurst > endBurst) {
      arrowCount++; // Increment arrow count for a new burst.
      startBurst = balloon[0]; // Start a new burst from the current balloon's start.
      endBurst = balloon[1]; // Set the end point of the new burst to the current balloon's end.
    }
  }

  // After processing all balloons, ensure the final arrow is counted.
  if (startBurst > endBurst) {
    arrowCount++;
  }

  // Return the total number of arrows used, adding 1 for the first burst.
  return arrowCount + 1;
}
