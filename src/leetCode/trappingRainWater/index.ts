function trap(barHeights: number[]): number {
  let totalWater = 0;
  let leftIndex = 0;

  while (leftIndex < barHeights.length - 2) {
    if (barHeights[leftIndex] === 0) {
      leftIndex++;
      continue;
    }

    let rightIndex = leftIndex + 1;
    let trappedWaterInSection = 0;
    let highestBarIndex = rightIndex;
    let waterUpToMaxHeight = 0;

    while (barHeights[rightIndex] < barHeights[leftIndex] && rightIndex < barHeights.length) {
      trappedWaterInSection += barHeights[leftIndex] - barHeights[rightIndex];

      if (barHeights[rightIndex] > barHeights[highestBarIndex]) {
        highestBarIndex = rightIndex;
        waterUpToMaxHeight = trappedWaterInSection;
      }
      rightIndex++;
    }

    if (rightIndex < barHeights.length) {
      totalWater += trappedWaterInSection;
      leftIndex = rightIndex;
      continue;
    }

    if (highestBarIndex > leftIndex + 1) {
      totalWater +=
        waterUpToMaxHeight -
        (barHeights[leftIndex] - barHeights[highestBarIndex]) * (highestBarIndex - leftIndex);
    }

    leftIndex = highestBarIndex;
  }

  return totalWater;
}
