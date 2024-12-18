func counterGame(n: Int) -> String {
    var currentNumber = n
    var turns = 0
    
    // Keep reducing the number until it becomes 1
    while currentNumber > 1 {
        let logBase2 = log2(Double(currentNumber))
        
        // If the number is a power of 2, divide it by 2
        if logBase2 == floor(logBase2) {
            currentNumber /= 2
        } else {
            // Otherwise, subtract the largest power of 2 less than the number
            currentNumber -= Int(pow(2, floor(logBase2)))
        }
        
        turns += 1
    }
    
    // Return the winner based on the turn count
    return turns % 2 == 0 ? "Richard" : "Louise"
}
