func isValid(s: String) -> String {
    // Frequency map of characters
    var freq = Array(s).reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
    
    // Extract frequency values into an array
    var frequencies = Array(freq.values)
    
    // Flag to track if one frequency has been adjusted
    var hasRemoved = false
    
    // Iterate over the frequencies to check the validity conditions
    for i in 1..<frequencies.count {
        let prevFreq = frequencies[i - 1]
        if prevFreq == -1 {
            continue
        }
        let currFreq = frequencies[i]
        
        let diff = abs(prevFreq - currFreq)
        
        // If frequencies are the same, no change needed
        if diff == 0 {
            continue
        }
        
        // If the difference is 1, and we haven't removed a frequency yet, adjust
        if diff == 1 {
            if hasRemoved { return "NO" }
            frequencies[i] = prevFreq  // Adjust current frequency to match previous
            hasRemoved = true
            continue
        }
        
        // If a frequency is 1, we can remove this character
        if currFreq == 1 {
            frequencies[i] = -1  // Mark as removed
            continue
        }
        
        // If none of the above conditions are met, the string is invalid
        return "NO"
    }
    
    // If all checks pass, the string is valid
    return "YES"
}
