func queensAttack(n: Int, k: Int, r_q: Int, c_q: Int, obstacles: [[Int]]) -> Int {
    let obstacleSet = Set(obstacles.map { "\($0[0]),\($0[1])" })
    
    func isValid(_ x: Int, _ y: Int) -> Bool {
        return x > 0 && x <= n && y > 0 && y <= n && !obstacleSet.contains("\(x),\(y)")
    }
    
    let directions = [(1, -1), (1, 0), (1, 1),
                    (0, -1),           (0, 1),
                    (-1, -1), (-1, 0), (-1, 1)]

    var count = 0
    for direction in directions {
        var nx = r_q + direction.0
        var ny = c_q + direction.1
        
        while isValid(nx, ny) {
            count += 1
            nx += direction.0
            ny += direction.1
        }
    }
    
    return count
}