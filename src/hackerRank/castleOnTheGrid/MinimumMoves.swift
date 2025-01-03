func minimumMoves(grid: [String], startX: Int, startY: Int, goalX: Int, goalY: Int) -> Int {
    let n = grid.count
    let board = grid.map { Array($0) }
    
    // Direction vectors for right, down, left, up
    let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    
    // Queue format: (x, y, previous direction, moves count)
    // Direction: 0=right, 1=down, 2=left, 3=up, -1=start
    var queue = [(startX, startY, -1, 0)]
    var visited = Set<String>()  // Format: "x,y,direction"
    var index = 0
    
    while index < queue.count {
        let (x, y, prevDir, moves) = queue[index]
        index += 1
        
        // Try all directions
        for (dir, (dx, dy)) in directions.enumerated() {
            var newX = x
            var newY = y
            
            // Move until hitting obstacle or edge
            while true {
                let nextX = newX + dx
                let nextY = newY + dy
                
                // Stop if hitting edge or obstacle
                if nextX < 0 || nextX >= n || nextY < 0 || nextY >= n || board[nextX][nextY] == "X" {
                    break
                }
                
                newX = nextX
                newY = nextY
                
                // Found goal
                if newX == goalX && newY == goalY {
                    return moves + (prevDir != dir ? 1 : 0)
                }
                
                // Check if this state was visited
                let state = "\(newX),\(newY),\(dir)"
                if !visited.contains(state) {
                    visited.insert(state)
                    // Add new move to queue (add 1 to moves if direction changed)
                    queue.append((newX, newY, dir, moves + (prevDir != dir ? 1 : 0)))
                }
            }
        }
    }
    
    return -1  // No path found
}