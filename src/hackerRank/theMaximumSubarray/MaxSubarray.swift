/// Solves the maximum subarray and subsequence problem using Kadane's algorithm
/// - Parameter numbers: Array of integers to analyze
/// - Returns: Array containing [maxSubarraySum, maxSubsequenceSum]
func maxSubarray(numbers: [Int]) -> [Int] {
    // Edge case: empty array
    guard !numbers.isEmpty else { return [0, 0] }
    
    // Initialize variables for Kadane's algorithm
    var maxEndingHere = numbers[0]    // Best sum ending at current position
    var maxSoFar = numbers[0]         // Best sum found so far
    var maxSubsequence = 0            // Sum of all positive numbers
    
    // Process array starting from second element
    for number in numbers {
        // Kadane's algorithm for contiguous subarray
        maxEndingHere = max(number, maxEndingHere + number)
        maxSoFar = max(maxSoFar, maxEndingHere)
        
        // Add positive numbers for subsequence
        if number > 0 {
            maxSubsequence += number
        }
    }
    
    // Handle case when all numbers are negative
    if maxSubsequence == 0 {
        maxSubsequence = numbers.max()!
        maxSoFar = maxSubsequence
    }
    
    return [maxSoFar, maxSubsequence]
}