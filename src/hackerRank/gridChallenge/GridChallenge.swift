func gridChallenge(grid: [String]) -> String {
    // Sort each row in the grid.
    // The sorted() function sorts the characters of each string (row) alphabetically.
    let sortedGrid = grid.map { $0.sorted() }
    
    // Get the number of columns in the grid (assuming all rows have equal length).
    let n = grid[0].count
    
    // Check each column to ensure the characters are in non-decreasing order.
    for i in 0..<n {
        for j in 0..<(sortedGrid.count - 1) {
            // If the character in the current row is greater than the character in the next row
            // in the same column, return "NO" as the grid is not sorted correctly in columns.
            if sortedGrid[j][i] > sortedGrid[j + 1][i] {
                return "NO"
            }
        }
    }
    
    // If no issue found in the column check, return "YES" indicating the grid is valid.
    return "YES"
}
