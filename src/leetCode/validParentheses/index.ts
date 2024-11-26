/**
 * Validates whether the input string has balanced parentheses, brackets, and braces.
 * The function checks if every opening bracket has a corresponding closing bracket
 * and if they are properly nested. If the string contains any characters other than
 * parentheses, brackets, or braces, the function will return false.
 *
 * @param inputString - A string containing a sequence of parentheses, brackets,
 *                      and braces. The string may also contain other characters.
 * @returns A boolean indicating whether the input string has valid bracket pairing.
 */
function isValid(inputString: string): boolean {
  // Arrays to define opening and closing brackets.
  const openingBrackets = ["(", "{", "["];
  const closingBrackets = [")", "}", "]"];

  // Stack to track unmatched opening brackets.
  const bracketStack: string[] = [];

  // Iterate through each character in the input string.
  for (const char of inputString) {
    // If the character is an opening bracket, push it onto the stack.
    if (openingBrackets.includes(char)) {
      bracketStack.push(char);
    }
    // If the character is a closing bracket, check for matching opening bracket.
    else if (closingBrackets.includes(char)) {
      const lastBracket = bracketStack.pop();

      // If no matching opening bracket exists for the current closing bracket, return false.
      if (char === ")" && lastBracket !== "(") {
        return false;
      }
      if (char === "}" && lastBracket !== "{") {
        return false;
      }
      if (char === "]" && lastBracket !== "[") {
        return false;
      }
    }
    // If the character is neither an opening nor closing bracket, return false.
    else {
      return false;
    }
  }

  // If the stack is empty, all opening brackets had a matching closing bracket.
  return bracketStack.length === 0;
}
