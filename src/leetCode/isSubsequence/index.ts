function isSubsequence(s: string, t: string): boolean {
  if (t.includes(s)) {
    return true;
  }
  let i = 0;
  let j = 0;
  while (i < s.length && j < t.length && i <= j) {
    if (s[i] === t[j]) {
      i++;
    }
    j++;
  }
  return i === s.length;
}
