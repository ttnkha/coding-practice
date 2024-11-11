function squares(a, b) {
  // Write your code here
  let count = 0;
  let i = 1;
  while (i * i <= b) {
    if (i * i >= a) {
      count++;
    }
    i++;
  }
  return count;
}
