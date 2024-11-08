function circularArrayRotation(a: number[], k: number, queries: number[]): number[] {
  // Write your code here
  const rotatedA =
    k !== a.length
      ? a.slice(a.length - (k % a.length), a.length).concat(a.slice(0, a.length - (k % a.length)))
      : [...a];
  for (let index = 0; index < queries.length; index++) {
    queries[index] = rotatedA[queries[index]];
  }
  return queries;
}
