// Helper function to print the array
func printArray(_ arr: [Int]) {
    print(arr.map { String($0) }.joined(separator: " "))
}

func insertionSort1(n: Int, arr: [Int]) -> Void {
    var replaced = arr
    
    for i in (1..<n).reversed() {
        let currentNumber = replaced[i]
        var j = i
        
        // Shift elements larger than currentNumber to the right
        while j > 0 && replaced[j-1] > currentNumber {
            replaced[j] = replaced[j-1]
            j -= 1
            printArray(replaced)
        }
        
        // Insert the current number in its correct position
        if j != i {
            replaced[j] = currentNumber
            printArray(replaced)
        }
    }
}