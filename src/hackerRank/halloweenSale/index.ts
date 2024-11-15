function howManyGames(p: number, d: number, m: number, s: number): number {
  // Return the number of games you can buy
  let cost = p;
  let games = 0;
  let remaining = s;
  while (remaining >= cost) {
    games++;
    remaining -= cost;
    cost = Math.max(cost - d, m);
  }
  return games;
}
