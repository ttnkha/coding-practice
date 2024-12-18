// Function to find the minimum unfairness (difference) in the k-sized subarrays
func maxMin(k: Int, arr: [Int]) -> Int {
    // Sort the array first for easy comparison of differences
    let sortedArr = arr.sorted()

    // Initialize the minimum unfairness to a large value
    var minDifference = Int.max
    
    // Iterate through possible subarrays of size k
    for i in 0...(sortedArr.count - k) {
        // Calculate the unfairness (difference) for each subarray and track the minimum
        let unfairness = sortedArr[i + k - 1] - sortedArr[i]
        minDifference = min(minDifference, unfairness)
    }
    
    return minDifference
}
