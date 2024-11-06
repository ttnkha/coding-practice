function lengthOfLastWord(s: string): number {
  let i = s.length - 1;
  let count = 0;
  while (i >= 0) {
    if (s[i] !== " ") {
      count++;
      i--;
      continue;
    }
    if (count > 0) {
      return count;
    }
    i--;
  }
  return count;
}
