function stones(n: number, a: number, b: number): number[] {
  let result: number[] = [];
  for (let i = n - 1; i >= 0; i--) {
    result.push(i * a + (n - 1 - i) * b);
  }
  return Array.from(new Set(result)).sort((a, b) => a - b);
}
