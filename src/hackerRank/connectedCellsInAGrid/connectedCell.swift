func connectedCell(matrix: [[Int]]) -> Int {
    let rows = matrix.count
    let cols = matrix[0].count
    let directions = [
        (-1, -1), (-1, 0), (-1, 1),
        (0, -1),           (0, 1),
        (1, -1), (1, 0), (1, 1)
    ]
    var maxSize = 0
    var grid = matrix
    
    func isValid(_ r: Int, _ c: Int) -> Bool {
        return r < rows && r >= 0 && c < cols && c >= 0 && grid[r][c] == 1 
    }
    
    func dfs(_ r: Int, _ c: Int) -> Int {
        grid[r][c] = 0
        var size = 1
        for (dr, dc) in directions {
            let newRow = r + dr
            let newCol = c + dc
            if isValid(newRow, newCol) {
                size += dfs(newRow, newCol)
            }
        }
        return size
    }
    
    for r in 0..<rows {
        for c in 0..<cols {
            if grid[r][c] == 1 {
                maxSize = max(maxSize, dfs(r, c))
            }
        }
    }
    
    return maxSize
}