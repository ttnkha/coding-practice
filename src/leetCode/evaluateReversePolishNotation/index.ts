/**
 * Evaluates the value of an expression given in Reverse Polish Notation (RPN).
 * This function processes a list of tokens representing an RPN expression and returns
 * the evaluated result.
 *
 * In RPN, operands precede their operators, and operators act on the most recent operands.
 * The function supports the four basic arithmetic operations: addition, subtraction, multiplication, and division.
 *
 * @param tokens - An array of strings representing the RPN expression.
 * @returns The result of the expression after evaluation.
 */
function evaluateRPN(tokens: string[]): number {
  // Define the list of valid operators
  const operators = ["+", "-", "*", "/"];

  // Stack to hold numbers for processing
  const stack: number[] = [];

  // Iterate through each token in the RPN expression
  for (const token of tokens) {
    if (!operators.includes(token)) {
      // If the token is a number, push it onto the stack
      stack.push(parseInt(token));
      continue;
    }

    // If the token is an operator, pop the last two numbers from the stack
    const firstOperand = stack.pop()!;
    const secondOperand = stack.pop()!;

    // Variable to hold the result of the operation
    let operationResult: number;

    // Perform the operation based on the operator
    switch (token) {
      case "+":
        operationResult = secondOperand + firstOperand;
        break;
      case "-":
        operationResult = secondOperand - firstOperand;
        break;
      case "*":
        operationResult = secondOperand * firstOperand;
        break;
      case "/":
        operationResult = Math.trunc(secondOperand / firstOperand); // Integer division
        break;
      default:
        throw new Error(`Unsupported operator: ${token}`);
    }

    // Push the result of the operation back onto the stack
    stack.push(operationResult);
  }

  // The final result will be the only element left in the stack
  return stack.pop() ?? 0;
}
