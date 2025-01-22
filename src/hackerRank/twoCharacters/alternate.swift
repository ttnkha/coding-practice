/// Find the length of longest possible string made up of two alternating characters
/// - Parameter s: Input string to process
/// - Returns: Length of the longest valid alternating string possible
func alternate(s: String) -> Int {
    // Extract unique characters from input string
    let uniqueChars = Array(Set(s))
    var maxLength = 0
    
    /// Check if a string has alternating characters
    /// - Parameter str: String to validate
    /// - Returns: True if characters alternate properly, false otherwise
    func isAlternating(_ str: String) -> Bool {
        // String must have at least 2 characters to alternate
        if str.count <= 1 { return false }
        
        let chars = Array(str)
        // Check each adjacent pair of characters
        for i in 1..<chars.count {
            // If two consecutive characters are same, pattern is invalid
            if chars[i] == chars[i - 1] {
                return false
            }
        }
        return true
    }
    
    // Try all possible pairs of unique characters
    for i in 0..<(uniqueChars.count - 1) {
        for j in (i + 1)..<uniqueChars.count {
            let char1 = uniqueChars[i]
            let char2 = uniqueChars[j]
            
            // Create string with only the current pair of characters
            let filtered = s.filter { $0 == char1 || $0 == char2 }
            
            // Update maxLength if current filtered string is valid
            if isAlternating(filtered) {
                maxLength = max(maxLength, filtered.count)
            }
        }
    }
    
    return maxLength
}

// Example usage:
// let result = alternate(s: "beabeefeab")  // Returns 5 (can form "babab")
// let result = alternate(s: "asdcbsdcagfw")  // Returns 4 (can form "bsbs")
// let result = alternate(s: "aa")  // Returns 0 (no valid alternating pattern possible)