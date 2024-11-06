function beautifulDays(i: number, j: number, k: number): number {
  let count = 0;
  for (let index = i; index <= j; index++) {
    const reversed = parseInt(index.toString().split("").reverse().join(""));
    if (Math.abs(index - reversed) % k === 0) {
      count++;
    }
  }
  return count;
}
