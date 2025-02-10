func lilysHomework(arr: [Int]) -> Int {
    let n = arr.count 
    
    if n <= 2 {
        return 0
    }
    
    let ascIndices = arr.enumerated().sorted(by: { $0.element < $1.element })
    let descIndices = arr.enumerated().sorted(by: { $0.element > $1.element })
    
    func countSwaps(_ indices: [(offset: Int, element: Int)]) -> Int {
        var visited = Array(repeating: false, count: n)
        var swaps = 0
        var pos = indices.enumerated().reduce(into: [Int: Int]()) { $0[$1.element.offset] = $1.offset }
        
        for i in 0..<n {
            if visited[i] || pos[i] == i { continue }
            
            var cycleCount = 0
            var j = i
            while !visited[j] {
                visited[j] = true
                j = pos[j]!
                cycleCount += 1
            }
            swaps += cycleCount - 1
        }
        
        return swaps
    }
    
    return min(countSwaps(ascIndices), countSwaps(descIndices))
}