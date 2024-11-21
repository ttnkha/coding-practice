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

function twoSumV2(nums: number[], target: number): number[] {
  let map: Record<number, number> = {};
  for (const [index, num] of nums.entries()) {
    if (typeof map[target - num] === "number") {
      return [index, map[target - num]];
    }
    map[num] = index;
  }
  return [];
}
