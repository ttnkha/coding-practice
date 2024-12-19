func bomberMan(n: Int, grid: [String]) -> [String] {
    let rows = grid.count
    let cols = grid[0].count
    let directions = [[0, 1], [0, -1], [1, 0], [-1, 0]]

    // Function to simulate a bomb explosion on the grid
    func transform(_ g: [String]) -> [String] {
        let chars = g.map { Array($0) }
        var result = [String]()
        
        for r in 0..<rows {
            var newRow = [Character]()
            for c in 0..<cols {
                if chars[r][c] == "O" {
                    newRow.append(".")
                } else if directions.contains(where: { 
                    let nr = r + $0[0], nc = c + $0[1]
                    return nr >= 0 && nr < rows && nc >= 0 && nc < cols && chars[nr][nc] == "O"
                }) {
                    newRow.append(".")
                } else {
                    newRow.append("O")
                }
            }
            result.append(String(newRow))
        }
        return result
    }
    
    // If n is 1, no change to the grid.
    if n <= 1 {
        return grid
    }

    // If n is 2 or even, return a grid full of bombs.
    if n == 2 || n % 2 == 0 {
        return Array(repeating: String(repeating: "O", count: cols), count: rows)
    }

    // For odd n, simulate two explosions: first and second.
    let first = transform(grid)
    let second = transform(first)
    
    // Return the correct grid based on the number of explosions.
    return ((n - 3) / 2) % 2 == 0 ? first : second
}
