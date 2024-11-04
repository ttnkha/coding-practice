/*
 * Complete the 'hurdleRace' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts the following parameters:
 *  1. INTEGER k - the maximum height the jumper can clear
 *  2. INTEGER_ARRAY height - an array of heights of the hurdles
 */

function hurdleRace(maxJumpHeight: number, hurdleHeights: number[]): number {
  // Find the maximum height of the hurdles
  const maxHurdleHeight = Math.max(...hurdleHeights);
  // Calculate the number of potions needed to clear the tallest hurdle
  const potionsNeeded = Math.max(maxHurdleHeight - maxJumpHeight, 0);
  return potionsNeeded;
}
