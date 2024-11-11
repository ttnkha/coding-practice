function libraryFine(d1, m1, y1, d2, m2, y2) {
  // Write your code here
  if (y2 > y1) {
    return 0;
  }
  if (y2 < y1) {
    return 10000;
  }
  if (m2 > m1) {
    return 0;
  }
  if (m2 === m1) {
    return 15 * Math.max(0, d1 - d2);
  }
  return 500 * (m1 - m2);
}
