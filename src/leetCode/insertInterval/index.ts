/**
 * Searches for the index of the first interval whose start time is greater than or equal to the given start time.
 *
 * @param intervals - The sorted list of intervals to search through.
 * @param start - The start time to search for.
 * @returns The index of the interval where the start time is greater than or equal to the given `start` time.
 */
function findStartIndex(intervals: number[][], start: number): number | null {
  let left = 0;
  let right = intervals.length - 1;
  let index: number | null = null;

  while (left <= right) {
    const mid = Math.floor((left + right) / 2);

    // If exact match with the start of an interval, return this index
    if (start === intervals[mid][0]) {
      index = mid;
      break;
    }

    // Adjust search bounds based on comparison with the current interval's start time
    if (start < intervals[mid][0]) {
      right = mid - 1;
    } else {
      index = mid;
      left = mid + 1;
    }
  }
  return index;
}

/**
 * Searches for the index of the last interval whose end time is less than or equal to the given end time.
 *
 * @param intervals - The sorted list of intervals to search through.
 * @param end - The end time to search for.
 * @returns The index of the interval where the end time is less than or equal to the given `end` time.
 */
function findEndIndex(intervals: number[][], end: number): number | null {
  let left = 0;
  let right = intervals.length - 1;
  let index: number | null = null;

  while (left <= right) {
    const mid = Math.floor((left + right) / 2);

    // If exact match with the end of an interval, return this index
    if (end === intervals[mid][1]) {
      index = mid;
      break;
    }

    // Adjust search bounds based on comparison with the current interval's end time
    if (end < intervals[mid][1]) {
      index = mid;
      right = mid - 1;
    } else {
      left = mid + 1;
    }
  }
  return index;
}

/**
 * Inserts a new interval into a sorted list of non-overlapping intervals, merging any overlapping intervals.
 *
 * @param intervals - The sorted list of intervals to insert into.
 * @param newInterval - The new interval to be inserted.
 * @returns A new array with the intervals after inserting and merging any overlaps.
 */
function insert(intervals: number[][], newInterval: number[]): number[][] {
  // If no intervals exist, just return the new interval
  if (!intervals.length) {
    return [newInterval];
  }

  // Find the position to insert the new interval based on its start and end times
  const startIndex = findStartIndex(intervals, newInterval[0]);
  const endIndex = findEndIndex(intervals, newInterval[1]);

  // Case 1: No overlaps (start and end indices are null)
  if (startIndex === null && endIndex === null) {
    return [newInterval];
  }

  // Case 2: No end index found, merge with previous interval if possible
  if (endIndex === null) {
    const prevInterval = intervals[startIndex!];
    if (newInterval[0] <= prevInterval[1]) {
      return [...intervals.slice(0, startIndex!), [prevInterval[0], newInterval[1]]];
    }
    return [...intervals.slice(0, startIndex!), prevInterval, newInterval];
  }

  // Case 3: No start index found, merge with next interval if possible
  if (startIndex === null) {
    const nextInterval = intervals[endIndex];
    if (newInterval[1] >= nextInterval[0]) {
      return [
        [newInterval[0], Math.max(newInterval[1], nextInterval[1])],
        ...intervals.slice(endIndex + 1),
      ];
    }
    return [newInterval, nextInterval, ...intervals.slice(endIndex + 1)];
  }

  // Case 4: Overlapping intervals, merge the range from start to end index
  if (startIndex === endIndex) {
    let mergedInterval = intervals.splice(startIndex, 1)[0];
    mergedInterval = [
      Math.min(mergedInterval[0], newInterval[0]),
      Math.max(mergedInterval[1], newInterval[1]),
    ];
    intervals.splice(startIndex, 0, mergedInterval);
    return intervals;
  }

  // Case 5: Intervals on both sides of the new interval, merge the ranges
  const result = intervals.slice(0, startIndex);
  let currentStart = intervals[startIndex][0];

  if (newInterval[0] > intervals[startIndex][1]) {
    result.push(intervals[startIndex]);
    currentStart = newInterval[0];
  }

  if (newInterval[1] < intervals[endIndex][0]) {
    result.push([currentStart, newInterval[1]]);
    currentStart = intervals[endIndex][0];
  }

  result.push([currentStart, intervals[endIndex][1]]);
  result.push(...intervals.slice(endIndex + 1));

  return result;
}
