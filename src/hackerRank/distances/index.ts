function minimumDistances(a: number[]): number {
  let map: Record<number, number[]> = {};
  let min = Infinity;
  for (let i = 0; i < a.length; i++) {
    const num = a[i];
    if (!map[num]) {
      map[num] = [i, i];
      continue;
    }
    if (map[num][1] < i) {
      map[num][0] = map[num][1];
      map[num][1] = i;
    }
    min = Math.min(map[num][1] - map[num][0], min);
  }
  return min === Infinity ? -1 : min;
}
