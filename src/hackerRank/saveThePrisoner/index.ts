function saveThePrisoner(n: number, m: number, s: number): number {
  const skipped = m % n;
  return (s + skipped - 1) % n || n;
}
