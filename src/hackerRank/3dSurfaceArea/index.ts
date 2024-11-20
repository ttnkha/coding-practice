function surfaceArea(A: number[][]): number {
  const m = A.length;
  const n = A[0].length;
  const adjacents = [
    [-1, 0],
    [1, 0],
    [0, 1],
    [0, -1],
  ];

  let result = 0;
  for (let i = 0; i < m; i++) {
    for (let j = 0; j < n; j++) {
      result += 4 * A[i][j] + 2;
      for (const adj of adjacents) {
        const row = adj[0] + i;
        const col = adj[1] + j;
        if (row >= 0 && row < m && col >= 0 && col < n) {
          result -= Math.min(A[i][j], A[row][col]);
        }
      }
    }
  }
  return result;
}
