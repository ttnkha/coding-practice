func organizingContainers(container: [[Int]]) -> String {
    let n = container.count
    
    var ballTypes = Array(repeating: 0, count: n)
    var containerCapacities = Array(repeating: 0, count: n)
    
    for i in 0..<n {
        for j in 0..<n {
            ballTypes[j] += container[i][j]
            containerCapacities[i] += container[i][j]
        }
    }
    
    ballTypes.sort()
    containerCapacities.sort()
    
    return ballTypes == containerCapacities ? "Possible" : "Impossible"
}