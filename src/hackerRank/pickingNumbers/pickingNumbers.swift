func pickingNumbers(a: [Int]) -> Int {
    guard !a.isEmpty else { return 0 }

    let frequency = a.reduce(into: [Int: Int]()) { $0[$1, default: 0] += 1 }
    var maxCount = 0
    
    for num in frequency.keys {
        maxCount = max(maxCount, frequency[num, default: 0] + frequency[num + 1, default: 0])
    }
    
    return maxCount
}
