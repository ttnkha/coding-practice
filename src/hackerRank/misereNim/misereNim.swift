func misereNim(s: [Int]) -> String {
    // Case 1: Check for endgame position
    // If the maximum number of stones in any pile is 1, determine the winner based on the number of piles.
    // If the number of piles is even, the first player wins, otherwise the second player wins.
    if (s.max()! == 1) {
        return s.count % 2 == 0 ? "First" : "Second"
    }
    
    // Case 2: Regular game position
    // This is similar to Case 1, but we use the XOR operation to calculate the Nim-sum (bitwise XOR of all pile sizes).
    // The game can be thought of as examining the bits of the numbers: 
    // If the number of 1-bits in the XOR result is even, the first player can force a win. 
    // If the number of 1-bits is odd, the second player has the advantage.
    let xor = s.reduce(0, ^)
    return xor == 0 ? "Second" : "First"
}
