func getWays(n: Int, c: [Int]) -> Int {
    // Handle edge cases
    guard n > 0, !c.isEmpty else { return 0 }
    
    // Filter and sort coins once
    let validCoins = c.filter { $0 <= n }.sorted()
    guard !validCoins.isEmpty else { return 0 }
    
    // Use dynamic programming with memoization
    var memo: [Int: Int] = [:]
    
    func calculateWays(amount: Int, startIndex: Int) -> Int {
        // Base cases
        if amount == 0 { return 1 }
        if amount < 0 || startIndex >= validCoins.count { return 0 }
        
        // Create unique key for memoization
        let key = amount * 1000 + startIndex
        
        // Check if result is already memoized
        if let cached = memo[key] {
            return cached
        }
        
        var ways = 0
        // Try each coin starting from startIndex
        for i in startIndex..<validCoins.count {
            let coin = validCoins[i]
            if coin <= amount {
                ways += calculateWays(amount: amount - coin, startIndex: i)
            }
        }
        
        // Store result in memo before returning
        memo[key] = ways
        return ways
    }
    
    return calculateWays(amount: n, startIndex: 0)
}