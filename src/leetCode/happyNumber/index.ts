/**
 * Determines if a number is a "happy number".
 * A happy number is defined as follows:
 * - Starting with any positive integer, replace the number by the sum of the squares of its digits.
 * - Repeat the process until the number equals 1 (at which point the number is happy) or loops endlessly in a cycle that does not include 1.
 *
 * @param num - The number to check.
 * @returns True if the number is a happy number, otherwise false.
 */
function isHappy(num: number): boolean {
  // Negative numbers cannot be happy numbers
  if (num <= 0) {
    return false;
  }

  let currentNum = num;

  // Continue processing the number until it reaches 1 or enters a cycle
  do {
    // Sum the squares of the digits
    currentNum = currentNum
      .toString()
      .split("")
      .reduce((sum, digit) => sum + Math.pow(Number(digit), 2), 0);
  } while (currentNum !== 1 && currentNum !== num && ![4, 9].includes(currentNum)); // Early exit for known cycles (4 and 9)

  // A happy number will eventually reach 1
  return currentNum === 1;
}
