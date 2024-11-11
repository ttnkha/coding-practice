// Function to calculate the maximum area that can be formed by two lines from the height array
function maxArea(heights: number[]): number {
  let maxArea = 0; // This will store the maximum area found so far
  let leftPointer = 0; // Pointer starting from the left side
  let rightPointer = heights.length - 1; // Pointer starting from the right side

  // Loop until the two pointers meet
  while (leftPointer < rightPointer) {
    // Calculate the area formed by the lines at the left and right pointers
    const currentArea =
      (rightPointer - leftPointer) * Math.min(heights[rightPointer], heights[leftPointer]);

    // Update the maxArea if the current area is larger
    maxArea = Math.max(currentArea, maxArea);

    // Move the pointer that points to the shorter line inward, in hopes of finding a larger area
    if (heights[rightPointer] > heights[leftPointer]) {
      leftPointer++;
    } else {
      rightPointer--;
    }
  }

  // Return the largest area found
  return maxArea;
}
