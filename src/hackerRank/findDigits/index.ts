function findDigits(n) {
  // Write your code here
  let count = 0;
  const numStr = String(n);
  for (const divisorStr of numStr) {
    const divisor = Number(divisorStr);
    if (isNaN(divisor) || divisor === 0) {
      continue;
    }
    if (n % divisor === 0) {
      count++;
    }
  }
  return count;
}
