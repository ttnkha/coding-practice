function jumpingOnClouds(c: number[]): number {
  // Write your code here
  let i = 0;
  let count = 0;
  while (i < c.length - 1) {
    if (!c[i + 2] || c[i + 1]) {
      i += 2;
    } else {
      i++;
    }
    count++;
  }
  return count;
}
