func findPlus(board: [[Character]], at indices: (Int, Int)) -> Int {
    let n = board.count
    let m = board[0].count
    let adjacents = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    
    func isValid(_ x: Int, _ y: Int) -> Bool {
        return x >= 0 && x < n &&
               y >= 0 && y < m &&
               board[x][y] == "G"
    }
    
    let x = indices.0
    let y = indices.1
    
    if !isValid(x, y) {
        return 0
    }
    
    var size = 0
    while true {
        let validArms = adjacents.allSatisfy { dir in
            let nx = x + dir.0 * (size + 1)
            let ny = y + dir.1 * (size + 1)
            return isValid(nx, ny)
        }
        
        if validArms {
            size += 1
        } else {
            break
        }
    }
    
    return size * 4 + 1
}

func doesOverlap(_ plus1: (position: (Int, Int), size: Int), _ plus2: (position: (Int, Int), size: Int)) -> Bool {
    let (x1, y1) = plus1.position
    let (x2, y2) = plus2.position
    let length1 = (plus1.size - 1) / 4
    let length2 = (plus2.size - 1) / 4
    
    var plus1Coords = Set<String>()
    
    plus1Coords.insert("\(x1)_\(y1)")
    
    if length1 > 0 {
        for i in 1...length1 {
            plus1Coords.insert("\(x1+i)_\(y1)")
            plus1Coords.insert("\(x1-i)_\(y1)")
            plus1Coords.insert("\(x1)_\(y1+i)")
            plus1Coords.insert("\(x1)_\(y1-i)")
        }
    }
    
    if plus1Coords.contains("\(x2)_\(y2)") {
        return true
    }
    
    if length2 > 0 {
        for i in 1...length2 {
            if plus1Coords.contains("\(x2+i)_\(y2)") ||
            plus1Coords.contains("\(x2-i)_\(y2)") ||
            plus1Coords.contains("\(x2)_\(y2+i)") ||
            plus1Coords.contains("\(x2)_\(y2-i)") {
                return true
            }
        }
    }
    
    return false
}

func twoPluses(grid: [String]) -> Int {
    let n = grid.count
    let m = grid[0].count
    let board = grid.map { Array($0) }
    
    var plusInfo = [(position: (Int, Int), size: Int)]()
    
    for i in 0..<n {
        for j in 0..<m {
            if board[i][j] == "G" {
                let size = findPlus(board: board, at: (i, j))
                if size > 0 {
                    plusInfo.append((position: (i, j), size: size))
                }
            }
        }
    }
    
    if plusInfo.count < 2 {
        return 0
    }
    
    var maxProduct = 0
    
    for i in 0..<plusInfo.count {
        let (pos1, maxSize1) = (plusInfo[i].position, (plusInfo[i].size - 1) / 4)
        
        for size1 in 0...maxSize1 {
            let plus1 = (position: pos1, size: size1 * 4 + 1)
            
            for j in 0..<plusInfo.count {
                if i == j { continue }
                
                let (pos2, maxSize2) = (plusInfo[j].position, (plusInfo[j].size - 1) / 4)
                
                for size2 in 0...maxSize2 {
                    let plus2 = (position: pos2, size: size2 * 4 + 1)
                    
                    if !doesOverlap(plus1, plus2) {
                        maxProduct = max(maxProduct, plus1.size * plus2.size)
                    }
                }
            }
        }
    }
    
    return maxProduct
}