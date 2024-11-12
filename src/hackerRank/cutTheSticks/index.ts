/**
 * This function simulates the process of repeatedly cutting the sticks in an array.
 * In each step, the minimum stick length is subtracted from all stick lengths.
 * The function returns an array of the number of sticks that remain after each cut.
 *
 * @param {number[]} stickLengths - An array of integers representing the initial stick lengths.
 * @returns {number[]} - An array where each element represents the number of sticks after each cut.
 */
function cutTheSticks(stickLengths: number[]): number[] {
  // Sort the stick lengths in ascending order to process them starting from the smallest
  const sortedSticks = [...stickLengths].sort((a: number, b: number) => a - b);

  // Array to store the result of the number of sticks remaining after each cut
  let cutsRemaining: number[] = [];

  // Continue the process as long as there are sticks to cut
  while (sortedSticks.length > 0) {
    // The minimum stick length for the current cut
    const minLength = sortedSticks[0];

    // Count how many sticks are the same length as the current minimum
    let cutCount = 0;

    // Remove all sticks of the current minimum length
    while (sortedSticks[0] === minLength) {
      sortedSticks.shift(); // Remove the first stick (which has the current minimum length)
      cutCount++; // Increase the count of the sticks of the minimum length
    }

    // Push the number of remaining sticks after the cut
    cutsRemaining.push(cutCount + sortedSticks.length);
  }

  return cutsRemaining;
}
