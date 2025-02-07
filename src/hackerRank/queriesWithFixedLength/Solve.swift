func solve(arr: [Int], queries: [Int]) -> [Int] {
    return queries.map { windowSize in
        // If windowSize = 1, return the minimum element in the array
        if windowSize == 1 {
            return arr.min()!
        }
        
        // If windowSize equals the array size, return the maximum element in the array
        if windowSize == arr.count {
            return arr.max()!
        }
        
        // Find the maximum value in the first window of length 'windowSize'
        var minOfMax = arr[..<windowSize].max()!
        
        // Array to store the maximum values of each sliding window
        var maxInWindows = [minOfMax]
        
        // Iterate through all possible sliding windows of length 'windowSize'
        for i in 1...(arr.count - windowSize) {
            // Compute the maximum value of the current window
            let currentMax = if maxInWindows.last! == arr[i - 1] {
                // If the previous max value is removed, recalculate the max
                arr[i..<(i + windowSize)].max()!
            } else {
                // Otherwise, take the maximum between the last max and the new element
                max(maxInWindows.last!, arr[i + windowSize - 1])
            }
            
            // Update the minimum value found among all window maximums
            minOfMax = min(minOfMax, currentMax)
            
            // Append the new max value to the maxInWindows array
            maxInWindows.append(currentMax)
        }
        
        return minOfMax
    }
}
