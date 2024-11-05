function angryProfessor(k: number, a: number[]): string {
  // Write your code here
  let threshold = 0;
  for (let i = 0; i < a.length; i++) {
    if (a[i] <= 0) {
      threshold++;
    }
    if (threshold >= k) {
      return "NO";
    }
  }
  return "YES";
}
