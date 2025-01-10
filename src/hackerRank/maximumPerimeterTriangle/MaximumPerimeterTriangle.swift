func maximumPerimeterTriangle(sticks: [Int]) -> [Int] {
    let sortedSticks = sticks.sorted()
    
    for i in stride(from: sortedSticks.count - 3, through: 0, by: -1) {
        if sortedSticks[i] + sortedSticks[i + 1] > sortedSticks[i + 2] {
            return Array(sortedSticks[i...i + 2])
        }
    }
    
    return [-1]
}
