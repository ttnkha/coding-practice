func isBalanced(s: String) -> String {
    // Dictionary to map closing brackets to their corresponding opening brackets.
    let pairs: [Character: Character] = [")": "(", "]": "[", "}": "{"]
    
    // Stack to keep track of the opening brackets.
    var stack: [Character] = []
    
    // Iterate through each character in the string.
    for char in s {
        // If the character is a closing bracket, check if it matches the top of the stack.
        if let opening = pairs[char] {
            // If stack is empty or the top of the stack doesn't match, return "NO".
            if stack.isEmpty || stack.popLast() != opening {
                return "NO"
            }
        } else {
            // If the character is an opening bracket, push it onto the stack.
            stack.append(char)
        }
    }
    
    // If the stack is empty, it means all opening brackets had matching closing brackets.
    return stack.isEmpty ? "YES" : "NO"
}
