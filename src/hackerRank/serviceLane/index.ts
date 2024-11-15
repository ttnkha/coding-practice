function serviceLane(width: number[], cases: number[][]): number[] {
  let result: number[] = [];
  for (const eachCase of cases) {
    if (eachCase.length !== 2) {
      continue;
    }
    const l = eachCase[0];
    const r = eachCase[1];
    let min = Infinity;
    for (let i = l; i <= r; i++) {
      min = Math.min(min, width[i]);
    }
    result.push(min);
  }
  return result;
}
