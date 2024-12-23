func icecreamParlor(m: Int, arr: [Int]) -> [Int] {
    var priceIndexMap = [Int: Int]()  // Dictionary to store price -> index mapping
    
    for (index, price) in arr.enumerated() {
        let complement = m - price  // The complement price we're looking for
        
        // Check if we've already encountered the complement price
        if let complementIndex = priceIndexMap[complement] {
            return [complementIndex + 1, index + 1]  // Return 1-based indices
        }
        
        // Store the current price and its index
        priceIndexMap[price] = index
    }
    
    return []  // Return an empty array if no solution is found
}
