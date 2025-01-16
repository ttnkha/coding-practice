/// Validates if a string can be made valid by removing at most one character.
/// A string is considered valid if all characters appear the same number of times.
/// - Parameter s: Input string to validate
/// - Returns: "YES" if string can be made valid, "NO" otherwise
func isValid(_ s: String) -> String {
    // Count frequency of each character
    let characterFrequencies = s.reduce(into: [Character: Int]()) { dict, char in
        dict[char, default: 0] += 1
    }
    
    // Convert to array of frequencies for easier manipulation
    var frequencies = Array(characterFrequencies.values)
    
    // Find the most common frequency
    let frequencyCount = frequencies.reduce(into: [Int: Int]()) { dict, freq in
        dict[freq, default: 0] += 1
    }
    let mostCommonFrequency = frequencyCount.max(by: { $0.value < $1.value })!.key
    
    // Track if we've already removed a character
    var hasRemovedCharacter = false
    
    // Check each frequency against the most common one
    for i in 1..<frequencies.count {
        let currentFrequency = frequencies[i]
        let difference = abs(mostCommonFrequency - currentFrequency)
        
        // Skip if frequency matches the most common one
        if difference == 0 {
            continue
        }
        
        // If we've already removed a character, string can't be made valid
        if hasRemovedCharacter {
            return "NO"
        }
        
        // Handle different cases for making the string valid
        if difference == 1 {
            // Can remove one occurrence of this character
            frequencies[i] = mostCommonFrequency
            hasRemovedCharacter = true
            continue
        }
        
        if currentFrequency == 1 {
            // Can remove the single occurrence of this character
            frequencies[i] = -1
            hasRemovedCharacter = true
            continue
        }
        
        // If we reach here, the string can't be made valid
        return "NO"
    }
    
    return "YES"
}

func isValidV2(_ s: String) -> String {
    // Get character frequencies
    let freq = s.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    let freqs = Array(freq.values)
    let set = Set(freqs)
    
    // If all frequencies are same or string has only one character
    if set.count == 1 { return "YES" }
    
    // If more than 2 different frequencies, can't make valid
    if set.count > 2 { return "NO" }
    
    // Get min and max frequencies and their counts
    let min = freqs.min()!, max = freqs.max()!
    let minCount = freqs.filter { $0 == min }.count
    let maxCount = freqs.filter { $0 == max }.count
    
    // Valid if removing one char makes all frequencies equal
    return (min == 1 && minCount == 1) || (max - min == 1 && maxCount == 1) ? "YES" : "NO"
}