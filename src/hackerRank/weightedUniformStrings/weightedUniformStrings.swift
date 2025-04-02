func weightedUniformStrings(s: String, queries: [Int]) -> [String] {
    // Store weights in a Set for O(1) lookup performance
    var weights: Set<Int> = []
    // Track the start of current uniform substring
    var startIndex = 0
    // Convert string to array for efficient character access
    let characters = Array(s)
    
    for (index, char) in s.enumerated() {
        // Calculate weight: 'a'=1, 'b'=2, etc.
        let weight = Int(char.asciiValue! - Character("a").asciiValue!) + 1
        // If character changes, update start of new uniform substring
        if char != characters[startIndex] {
            startIndex = index
        }
        // Calculate and store weight: single char weight * length of uniform substring
        weights.insert(Int(weight) * (index - startIndex + 1))
    }
    
    // Check if each query weight exists in our calculated weights
    return queries.map { weights.contains($0) ? "Yes" : "No" }
}