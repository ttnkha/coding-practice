/**
 * This function processes a series of queries to modify an array of arrays and return results.
 *
 * The function works with two types of queries:
 * 1. `1 x y`: This query appends the value `y` to the subarray `subArray[idx]`, where `idx` is calculated using the XOR operation between `x` and the lastAnswer, modulo `n` (the size of the outer array).
 * 2. `2 x y`: This query assigns the value from `subArray[idx][y % size]` to `lastAnswer` and appends it to the result array. The index `idx` is again determined using the XOR operation.
 *
 * @param n - The number of subarrays in the outer array `subArrays`.
 * @param queries - An array of queries, where each query is represented as an array of three integers `[queryType, x, y]`.
 * @returns A list of integers representing the results of all type 2 queries.
 */
func dynamicArray(n: Int, queries: [[Int]]) -> [Int] {
    // Result array to store answers for type 2 queries
    var results: [Int] = []
    
    // 2D array of subarrays initialized with `n` empty subarrays
    var subArrays: [[Int]] = Array(repeating: [], count: n)
    
    // Variable to store the value of lastAnswer, initialized to 0
    var lastAnswer = 0
    
    // Loop through each query in the `queries` array
    for i in 0..<queries.count {
        // Extract the query type (1 or 2), and values of x and y
        let queryType = queries[i][0]
        let x = queries[i][1]
        let y = queries[i][2]
        
        // Calculate the index for the subarray using XOR and modulo operation
        let idx = (x ^ lastAnswer) % n
        
        // Process the query based on its type
        if queryType == 1 {
            // Type 1 query: Append `y` to the subarray `subArrays[idx]`
            subArrays[idx].append(y)
        } else if queryType == 2 {
            // Type 2 query: Assign the value from subArrays[idx][y % size] to `lastAnswer`
            lastAnswer = subArrays[idx][y % subArrays[idx].count]
            // Append the result of the type 2 query to `results`
            results.append(lastAnswer)
        }
    }
    
    // Return the final result array containing the answers to all type 2 queries
    return results
}
