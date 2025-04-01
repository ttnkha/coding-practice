func insertionSort2(n: Int, arr: [Int]) -> Void {
    func printArray(_ arr: [Int]) {
        print(arr.map { String($0) }.joined(separator: " "))
    }

    var sorted = arr
    for i in 0..<(n-1) {
        if sorted[i] > sorted[i + 1] {
            let currentNumber = sorted[i + 1]
            var j = i + 1
            while j > 0 && sorted[j - 1] > currentNumber {
                sorted.swapAt(j, j-1)
                j -= 1
            }
        }
        printArray(sorted)
    }
}