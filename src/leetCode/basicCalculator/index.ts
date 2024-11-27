function calculate(s: string): number {
  const stack: number[] = []; // Stack to store numbers and signs for handling parentheses
  let currentNumber = 0; // Current number being built from the string
  let sign = 1; // 1 for positive, -1 for negative
  let numStr = ""; // Temporary string to build multi-digit numbers

  // Loop through each character in the string
  for (const char of s) {
    if (char === " ") {
      continue; // Skip spaces as they are not important
    }

    // If the character is a digit, build the number
    if (!isNaN(Number(char))) {
      numStr += char;
      continue;
    }

    // When a full number is formed, process it
    if (numStr.length) {
      currentNumber += sign * Number(numStr); // Apply the sign to the number and add it to the result
      numStr = ""; // Reset the temporary string
      sign = 1; // Reset the sign to positive for next numbers
    }

    // Handle operators and parentheses
    switch (char) {
      case "+":
        sign = 1; // Set sign to positive for the next number
        break;

      case "-":
        sign = -1; // Set sign to negative for the next number
        break;

      case "(":
        // Push the current result and sign onto the stack to handle parentheses
        stack.push(currentNumber);
        stack.push(sign);
        currentNumber = 0; // Reset the current number
        sign = 1; // Reset the sign
        break;

      case ")":
        // When encountering ')', pop the sign and the previous result from the stack
        currentNumber *= stack.pop()!; // Apply the sign popped from the stack
        currentNumber += stack.pop()!; // Add the previous result (also popped)
        sign = 1; // Reset the sign
        break;
    }
  }

  // If there's a number left after the loop, apply it
  currentNumber += sign * (numStr.length ? Number(numStr) : 0);

  return currentNumber; // Return the final result
}
