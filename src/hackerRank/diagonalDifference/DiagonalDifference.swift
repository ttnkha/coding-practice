// Function to calculate the absolute difference between the sums of a square matrix's diagonals
// arr: A square matrix (2D array), where arr[i][i] represents the left diagonal and arr[i][arr[i].count - 1 - i] represents the right diagonal
// Returns the absolute difference between the sums of the two diagonals

func diagonalDifference(matrix: [[Int]]) -> Int {
    let n = matrix.count  // Get the size of the matrix (assuming it's square)
    
    var leftDiagonalSum = 0  // Variable to accumulate the sum of the left diagonal
    var rightDiagonalSum = 0  // Variable to accumulate the sum of the right diagonal
    
    // Iterate through the rows of the matrix
    for i in 0..<n {
        leftDiagonalSum += matrix[i][i]  // Add the current element to the left diagonal sum
        rightDiagonalSum += matrix[i][n - 1 - i]  // Add the current element to the right diagonal sum
    }
    
    // Return the absolute difference between the sums of the diagonals
    return abs(leftDiagonalSum - rightDiagonalSum)
}
