func marsExploration(s: String) -> Int {
    var count = 0
    
    for (index, char) in s.enumerated() {
        // Check if the character matches the expected "SOS" pattern
        if char != "SOS"[(index % 3)] {
            count += 1
        }
    }
    
    return count
}
