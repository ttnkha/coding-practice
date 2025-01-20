func stockMax(prices: [Int]) -> Int {
    var sharesOwned = 0
    var totalCost = 0
    var profit = 0
    var currentMaxPrice = prices.max()!
    
    for (index, price) in prices.enumerated() {
        if price == currentMaxPrice {
            profit += price * sharesOwned - totalCost
            totalCost = 0
            sharesOwned = 0
            if index + 1 < prices.count {
                currentMaxPrice = prices[(index+1)...].max()!
            }
        } else {
            sharesOwned += 1
            totalCost += price
        }
    }
    
    return profit
}

func stockMaxV2(prices: [Int]) -> Int {
    // Early return for edge cases
    guard prices.count > 1 else { return 0 }
    
    var profit = 0
    var currentMax = 0
    
    // Process prices from right to left to find optimal selling points
    // This eliminates the need for repeated max calculations
    for price in prices.reversed() {
        if price > currentMax {
            currentMax = price
        } else {
            // If current price is less than max, buy at current and sell at max
            profit += currentMax - price
        }
    }
    
    return profit
}