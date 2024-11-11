function extraLongFactorials(n) {
  // Write your code here
  let result = BigInt(1);
  let i = n;
  while (i >= 2) {
    result *= BigInt(i);
    i--;
  }
  console.log(String(result));
}
