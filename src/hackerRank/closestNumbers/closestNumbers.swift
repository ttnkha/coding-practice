func closestNumbers(arr: [Int]) -> [Int] {
    let sorted = arr.sorted()
    var minDiff = Int.max
    var result: [Int] = []
    
    for i in 0..<(sorted.count - 1) {
        let diff = sorted[i + 1] - sorted[i]
        if diff < minDiff {
            minDiff = diff
            result = [sorted[i], sorted[i + 1]]
        } else if diff == minDiff {
            result.append(contentsOf: [sorted[i], sorted[i + 1]])
        }
    }
    
    return result
}
