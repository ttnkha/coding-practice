func superDigit(n: String, k: Int) -> Int {
    // Helper function to calculate the super digit of a number
    func calculateSuperDigit(_ num: Int) -> Int {
        if num < 10 {
            return num
        }
        return calculateSuperDigit(num.reduce(0, { $0 + $1 }))
    }
    
    // Calculate the sum of digits of n
    let initialSum = n.reduce(0) { $0 + Int(String($1))! }
    
    // Calculate the initial number by multiplying the sum of digits of n with k
    let initialNum = initialSum * k
    
    // Use the recursive function to calculate the super digit of the initial number
    return calculateSuperDigit(initialNum)
}
