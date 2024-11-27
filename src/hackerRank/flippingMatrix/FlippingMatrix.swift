func flippingMatrix(matrix: [[Int]]) -> Int {
    let n = matrix.count / 2  // Half the size of the matrix since it's 2n x 2n
    var maxSum = 0  // Initialize the maximum sum to 0

    // Loop through the top-left n x n submatrix
    for i in 0..<n {
        for j in 0..<n {
            // Retrieve the 4 possible values that can be in the current position (i, j) after flipping rows and/or columns
            let topLeft = matrix[i][j]  // Current element at (i, j)
            let topRight = matrix[i][2 * n - 1 - j]  // Flipped column (same row, flipped column)
            let bottomLeft = matrix[2 * n - 1 - i][j]  // Flipped row (flipped row, same column)
            let bottomRight = matrix[2 * n - 1 - i][2 * n - 1 - j]  // Flipped both row and column
            
            // Choose the maximum value from the 4 possible values and add it to the sum
            maxSum += max(topLeft, topRight, bottomLeft, bottomRight)
        }
    }

    // Return the maximum sum obtained from the flipped matrix
    return maxSum
}
