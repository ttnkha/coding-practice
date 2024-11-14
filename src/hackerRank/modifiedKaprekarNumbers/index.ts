/**
 * Finds and prints all Kaprekar numbers in the range [p, q].
 * A Kaprekar number is a number where the sum of the left and right parts of its square equals the number itself.
 *
 * @param start - The start of the range (inclusive).
 * @param end - The end of the range (inclusive).
 */
function kaprekarNumbers(start: number, end: number): void {
  let kaprekarNumbers: number[] = []; // Array to store the Kaprekar numbers found
  let currentNumber = start; // Start iterating from 'start'

  // Iterate through the range from start to end
  while (currentNumber <= end) {
    let numDigits = String(currentNumber).length; // Get the number of digits of the current number
    const squared = Math.pow(currentNumber, 2).toString(); // Square the number and convert it to a string

    // Check if the square has the correct number of digits (either 2 * numDigits or 2 * numDigits - 1)
    if (squared.length !== 2 * numDigits && squared.length !== 2 * numDigits - 1) {
      currentNumber++;
      continue; // Skip this number if it doesn't meet the digit condition
    }

    // Split the squared number into two parts
    const divisionPoint = Math.floor(squared.length / 2);
    const leftPart = squared.substring(0, divisionPoint) || "0"; // Left part or "0" if empty
    const rightPart = squared.substring(divisionPoint) || "0"; // Right part or "0" if empty

    // Check if the sum of the left and right parts equals the current number
    if (parseInt(leftPart) + parseInt(rightPart) === currentNumber) {
      kaprekarNumbers.push(currentNumber); // Add the number to the result array
    }

    currentNumber++; // Move to the next number in the range
  }

  // Print the result: either the Kaprekar numbers found, or "INVALID RANGE" if none found
  console.log(kaprekarNumbers.length ? kaprekarNumbers.join(" ") : "INVALID RANGE");
}
