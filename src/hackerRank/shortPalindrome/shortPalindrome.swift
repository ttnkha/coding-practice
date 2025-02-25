func shortPalindrome(s: String) -> Int {
    let MOD = 1_000_000_007  // Define a modulus to prevent integer overflow
    var count = 0  // Variable to store the total count of valid ABBA palindromes
    
    // Array to count occurrences of each character (A-Z)
    var charCount = Array(repeating: 0, count: 26)
    
    // Array to count occurrences of character pairs (AB, AC, ...)
    var pairCount = Array(repeating: Array(repeating: 0, count: 26), count: 26)
    
    // Array to count occurrences of three-character sequences (ABB, ACC, ...)
    var tripleCount = Array(repeating: 0, count: 26)
    
    for char in s {
        let i = Int(char.asciiValue! - Character("a").asciiValue!)  // Convert character to index (0-25)
        
        // Add the count of sequences forming ABBA where 'A' == char
        count = (count + tripleCount[i]) % MOD
        
        // Update tripleCount: Add pairs (ABB) that can form ABBA when 'A' appears
        for j in 0..<26 {
            tripleCount[j] = (tripleCount[j] + pairCount[j][i]) % MOD
        }
        
        // Update pairCount: Add new pairs (AB) based on previous single character counts
        for j in 0..<26 {
            pairCount[j][i] = (pairCount[j][i] + charCount[j]) % MOD
        }
        
        // Update character count
        charCount[i] += 1
    }
    
    return count  // Return the total number of valid ABBA sequences
}
