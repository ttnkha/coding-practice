function twoSum(numbers: number[], target: number): number[] {
  let map: Record<string, number> = {};
  for (const [index, num] of numbers.entries()) {
    if (map[target - num] !== undefined) {
      return [map[target - num], index + 1];
    }
    map[num] = index + 1;
  }
  return [];
}
