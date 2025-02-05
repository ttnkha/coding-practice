func permutationGame(arr: [Int]) -> String {
    // Helper function to check if the array is in increasing order
    func isIncreasing(_ array: [Int]) -> Bool {
        for i in 1..<array.count {
            if array[i - 1] > array[i] {
                return false
            }
        }
        return true
    }
    
    // Recursive function to determine if the current player can force a win
    func canWin(_ currentArr: [Int], _ memo: inout [String: Bool]) -> Bool {
        let key = currentArr.map(String.init).joined(separator: ",")
        
        // Check if the result is already computed
        if let result = memo[key] {
            return result
        }
        
        // If the array is already sorted in increasing order, current player loses
        if isIncreasing(currentArr) {
            return false
        }
        
        // Try removing each element and check if the opponent loses
        for i in 0..<currentArr.count {
            var newArr = currentArr
            newArr.remove(at: i)
            
            // If the opponent loses in any scenario, current player wins
            if !canWin(newArr, &memo) {
                memo[key] = true
                return true
            }
        }
        
        // If no winning move is found, current player loses
        memo[key] = false
        return false
    }
    
    var memo: [String: Bool] = [:]
    return canWin(arr, &memo) ? "Alice" : "Bob"
}