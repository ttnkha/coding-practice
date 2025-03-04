func efficientJanitor(weight: [Float]) -> Int {
    let filteredWeight = weight.filter { $0 <= 3.0 }
    let sortedWeight = filteredWeight.sorted()
    
    var count = weight.count - filteredWeight.count  // Count for items > 3.0
    var left = 0
    var right = sortedWeight.count - 1
    
    while left <= right {
        if left == right {
            // Single item left
            count += 1
            break
        }
        
        if sortedWeight[left] + sortedWeight[right] <= 3.0 {
            // Can pair these two items
            left += 1
            right -= 1
            count += 1
        } else {
            // Right item alone
            right -= 1
            count += 1
        }
    }
    
    return count
}