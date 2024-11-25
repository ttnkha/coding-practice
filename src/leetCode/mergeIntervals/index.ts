/**
 * Merges overlapping intervals from a list of intervals.
 *
 * This function takes an array of intervals, sorts them by the start time, and merges any overlapping intervals
 * into one continuous interval. The result is an array of merged intervals.
 *
 * @param intervals - An array of intervals, where each interval is represented as a pair [start, end].
 * @returns A new array with the merged intervals.
 */
function merge(intervals: number[][]): number[][] {
  // Sort intervals by the start time of each interval
  const sortedIntervals = intervals.sort((a, b) => a[0] - b[0]);

  let mergedIntervals: number[][] = [];
  let currentStart = sortedIntervals[0][0]; // Start of the first interval
  let currentEnd = sortedIntervals[0][1]; // End of the first interval

  // Iterate over the sorted intervals and merge overlaps
  for (let i = 1; i < sortedIntervals.length; i++) {
    const currentInterval = sortedIntervals[i];

    // If current interval starts before or at the end of the last merged interval, merge them
    if (currentInterval[0] <= currentEnd) {
      currentEnd = Math.max(currentEnd, currentInterval[1]);
    } else {
      // No overlap, push the current merged interval and start a new one
      mergedIntervals.push([currentStart, currentEnd]);
      currentStart = currentInterval[0];
      currentEnd = currentInterval[1];
    }
  }

  // Push the last interval into the result array
  mergedIntervals.push([currentStart, currentEnd]);

  return mergedIntervals;
}
