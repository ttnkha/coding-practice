func minimumMoves(_ n: Int, _ x: Int, _ y: Int) -> Int {
    let moves = [(x, y), (x, -y), (-x, y), (-x, -y),
                (y, x), (y, -x), (-y, x), (-y, -x)]
    var visited = Array(repeating: Array(repeating: -1, count: n), count: n)
    
    var queue = [(0, 0)]
    visited[0][0] = 0
    
    var queueIndex = 0
    while queueIndex < queue.count {
        let (x, y) = queue[queueIndex]
        queueIndex += 1
        
        if x == n - 1 && y == n - 1 {
            return visited[x][y]
        }
        
        for (dx, dy) in moves {
            let newX = x + dx
            let newY = y + dy
            
            if newX >= 0, newX < n, newY >= 0, newY < n, visited[newX][newY] == -1 {
                visited[newX][newY] = visited[x][y] + 1
                queue.append((newX, newY))
            }
        }
    }
    
    return -1
}

func knightlOnAChessboard(n: Int) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: n - 1), count: n - 1)
    
    for i in 1..<n {
        for j in 1..<n {
            result[i-1][j-1] = minimumMoves(n, i, j)
        }
    }
    
    return result
}