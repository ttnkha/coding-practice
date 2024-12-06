func isPangram(_ s: String) -> String {
    var letterCounts = Array(repeating: 0, count: 26)
    
    for char in s.lowercased() {
        if char.isLetter {
            letterCounts[Int(char.asciiValue! - 97)] += 1
        }
    }
    
    return letterCounts.contains(0) ? "not pangram" : "pangram"
}
