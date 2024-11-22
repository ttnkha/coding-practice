function summaryRanges(nums: number[]): string[] {
  let result: string[] = [];
  let start = nums[0];
  let i = 1;
  while (i <= nums.length) {
    if (nums[i] - nums[i - 1] !== 1) {
      if (nums[i - 1] !== start) {
        result.push(`${start}->${nums[i - 1]}`);
      } else {
        result.push(nums[i - 1].toString());
      }
      start = nums[i];
    }
    i++;
  }
  return result;
}
