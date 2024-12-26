/// Finds minimum value among maximums of sliding windows for each query
/// - Parameters:
///   - array: Input array of integers
///   - windowSizes: Array of window sizes to analyze
/// - Returns: Array of minimum values for each window size
func solve(array: [Int], windowSizes: [Int]) -> [Int] {
    let size = array.count
    var results: [Int] = []
    
    // Process each window size
    for windowSize in windowSizes {
        // Skip if window is larger than array
        if size < windowSize {
            continue
        }
        
        // Handle special cases
        if size == windowSize {
            results.append(array.max()!)
            continue
        }
        if windowSize == 1 {
            results.append(array.min()!)
            continue
        }
        
        // Find max of first window
        let firstMax = array[0..<windowSize].max()!
        var windowMaxes = [firstMax]
        
        // Slide window and calculate max for each position
        for i in 1...(size - windowSize) {
            if windowMaxes.last! == array[i - 1] {
                // Previous max left the window, recalculate
                windowMaxes.append(array[i..<(i + windowSize)].max()!)
            } else {
                // Compare current max with new element
                windowMaxes.append(max(windowMaxes.last!, array[i + windowSize - 1]))
            }
        }
        
        // Add minimum of all window maximums
        results.append(windowMaxes.min()!)
    }
    
    return results
}