func matrixRotation(matrix: [[Int]], r: Int) -> Void {
    let rowCount = matrix.count
    let colCount = matrix[0].count
    
    func rotatedIndex(_ layer: Int, _ step: Int) -> (x: Int, y: Int)? {
        let rowLength = rowCount - 2 * layer
        let colLength = colCount - 2 * layer
        
        guard rowLength > 0, colLength > 0 else {
            return nil
        }
        
        let newStep = (step + r) % (2 * colLength + 2 * rowLength - 4)
        
        if newStep < colLength {
            return (x: layer, y: layer + newStep)
        }
        if newStep < colLength + rowLength - 1 {
            return (x: layer + newStep - colLength + 1, y: layer + colLength - 1)
        }
        if newStep < 2 * colLength + rowLength - 2 {
            return (x: layer + rowLength - 1, y: layer + 2 * colLength + rowLength - 3 - newStep)
        }
        return (x: layer + 2 * rowLength + 2 * colLength - 4 - newStep, y: layer)
    }
    
    var rotatedMatrix = Array(repeating: Array(repeating: -1, count: colCount), count: rowCount)
    
    for layer in 0..<colCount/2 {
        var i = layer
        var j = layer
        var step = 0
        
        while j < colCount - layer - 1 {
            if let (x, y) = rotatedIndex(layer, step) {
                rotatedMatrix[i][j] = matrix[x][y]
            }
            
            j += 1
            step += 1
        }
        while i < rowCount - layer - 1 {
            if let (x, y) = rotatedIndex(layer, step) {
                rotatedMatrix[i][j] = matrix[x][y]
            }
            
            i += 1
            step += 1
        }
        while j > layer {
            if let (x, y) = rotatedIndex(layer, step) {
                rotatedMatrix[i][j] = matrix[x][y]
            }
            
            j -= 1
            step += 1
        }
        while i > layer {
            if let (x, y) = rotatedIndex(layer, step) {
                rotatedMatrix[i][j] = matrix[x][y]
            }
            
            i -= 1
            step += 1
        }
    }
    
    for i in 0..<rowCount {
        var row = [String]()
        for j in 0..<colCount {
            row.append(String(rotatedMatrix[i][j]))
        }
        print(row.joined(separator: " "))
    }
}

func matrixRotationGptVersion(matrix: [[Int]], rotations: Int) {
    let numRows = matrix.count
    let numCols = matrix[0].count
    var rotatedMatrix = Array(repeating: Array(repeating: 0, count: numCols), count: numRows)
    
    func getLayerPositions(layerIndex: Int) -> [(Int, Int)] {
        var positions: [(Int, Int)] = []
        let topRow = layerIndex, bottomRow = numRows - layerIndex - 1
        let leftCol = layerIndex, rightCol = numCols - layerIndex - 1
        
        for j in leftCol...rightCol { positions.append((topRow, j)) }
        for i in (topRow + 1)...bottomRow { positions.append((i, rightCol)) }
        if topRow < bottomRow {
            for j in (leftCol..<rightCol).reversed() { positions.append((bottomRow, j)) }
        }
        if leftCol < rightCol {
            for i in (topRow + 1..<bottomRow).reversed() { positions.append((i, leftCol)) }
        }
        
        return positions
    }
    
    func rotateLayer(_ positions: [(Int, Int)], shiftAmount: Int) {
        let numElements = positions.count
        let adjustedShift = shiftAmount % numElements
        for i in 0..<numElements {
            let (sourceX, sourceY) = positions[i]
            let (destX, destY) = positions[(i + adjustedShift) % numElements]
            rotatedMatrix[destX][destY] = matrix[sourceX][sourceY]
        }
    }
    
    let totalLayers = min(numRows, numCols) / 2
    for layerIndex in 0..<totalLayers {
        let positions = getLayerPositions(layerIndex: layerIndex)
        rotateLayer(positions, shiftAmount: rotations)
    }
    
    for row in rotatedMatrix {
        print(row.map { String($0) }.joined(separator: " "))
    }
}