func minimumLoss(price: [Int]) -> Int {
    // Pair prices with their original indices
    let indexedPrices = price.enumerated().map { (index, value) in (value, index) }
    
    // Sort the prices while keeping their indices
    let sortedPrices = indexedPrices.sorted { $0.0 < $1.0 }
    
    var minLoss = Int.max
    
    // Compare consecutive sorted prices
    for i in 1..<sortedPrices.count {
        let currentPrice = sortedPrices[i]
        let previousPrice = sortedPrices[i - 1]
        
        // Ensure that the higher price occurred earlier (by index)
        if currentPrice.1 < previousPrice.1 {
            minLoss = min(minLoss, currentPrice.0 - previousPrice.0)
        }
    }
    
    return minLoss
}