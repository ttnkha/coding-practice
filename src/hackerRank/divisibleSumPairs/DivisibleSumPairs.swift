func divisibleSumPairs(n: Int, k: Int, ar: [Int]) -> Int {
    return ar.enumerated().flatMap { (offset, element) in
        ar[(offset + 1)...].map { element + $0 }
     }
     .filter { $0 % k == 0 }
     .count
}