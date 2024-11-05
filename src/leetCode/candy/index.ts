function candy(ratings: number[]): number {
  let totalCandy = 0;
  let currentIndex = 0;

  let sequenceLength = 0;
  let currentSequenceValue = 0;
  let previousSequenceValue = 0;
  let isIncreasingSequence: boolean | null = null;

  while (currentIndex < ratings.length) {
    const currentRating = ratings[currentIndex];
    const previousRating = ratings[currentIndex - 1];

    if (currentRating === previousRating) {
      const startValue = isIncreasingSequence ? 1 : sequenceLength;
      totalCandy += currentSequenceValue - Math.min(previousSequenceValue, startValue) + 1;
      currentSequenceValue = 1;
      sequenceLength = 1;
      previousSequenceValue = 1;
      currentIndex++;
      isIncreasingSequence = false;
      continue;
    }

    const isIncreasing = currentRating > previousRating;
    if (isIncreasing !== isIncreasingSequence && sequenceLength > 1) {
      const startValue = isIncreasingSequence ? 1 : sequenceLength;
      totalCandy += currentSequenceValue - Math.min(previousSequenceValue, startValue);
      previousSequenceValue = isIncreasingSequence ? sequenceLength : 1;
      currentSequenceValue = 1;
      sequenceLength = 1;
    }

    currentSequenceValue += sequenceLength + 1;
    sequenceLength += 1;

    isIncreasingSequence = isIncreasing;
    currentIndex++;
  }

  const startValue = isIncreasingSequence ? 1 : sequenceLength;
  totalCandy += currentSequenceValue - Math.min(previousSequenceValue, startValue);

  return totalCandy;
}
