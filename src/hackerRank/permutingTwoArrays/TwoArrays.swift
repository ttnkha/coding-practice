func canPairSumGreaterThanK(k: Int, A: [Int], B: [Int]) -> String {
    let ascendingA = A.sorted()
    let descendingB = B.sorted(by: >)
    
    // Check if the sum of corresponding pairs is at least k
    for i in 0..<ascendingA.count {
        if ascendingA[i] + descendingB[i] < k {
            return "NO"
        }
    }
    return "YES"
}