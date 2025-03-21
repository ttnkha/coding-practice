func larrysArray(A: [Int]) -> String {
    let n = A.count
    
    var unsorted = 0
    for i in 0..<n {
        for j in (i+1)..<n {
            if A[i] > A[j] {
               unsorted += 1 
            }
        }
    }
    
    return unsorted % 2 == 0 ? "YES" : "NO"
}