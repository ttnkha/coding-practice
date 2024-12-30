func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
    // Create an array to store differences
    var arr = Array(repeating: 0, count: n + 2)
    
    // Process all queries using prefix sum technique
    for query in queries {
        let start = query[0]
        let end = query[1]
        let value = query[2]
        
        // Add value at start index
        arr[start] += value
        
        // Subtract value at end + 1 index to handle range closure
        arr[end + 1] -= value
    }
    
    // Track maximum value and running sum
    var maxValue: Int = 0
    var runningSum: Int = 0
    
    // Calculate prefix sums and find maximum
    for i in 1...n {
        runningSum += arr[i]
        maxValue = max(maxValue, runningSum)
    }
    
    return maxValue
}