function permutationEquation(p: number[]): number[] {
  // Write your code here
  let result: number[] = [];
  let map: Record<string, number> = {};
  for (const [index, num] of p.entries()) {
    map[num] = index + 1;
  }
  for (let i = 1; i < p.length + 1; i++) {
    result.push(map[map[i]]);
  }
  return result;
}
