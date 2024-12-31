func highestValuePalindrome(s: String, n: Int, k: Int) -> String {
    // Handle edge cases
    if n == 0 || s.isEmpty { return "-1" }
    // If we have more changes than string length, make all 9's
    if n <= k { return String(repeating: "9", count: n) }
    
    var chars = Array(s)
    var changesNeeded = 0
    let mid = n / 2
    
    // First pass: Count minimum changes needed to make palindrome
    for i in 0..<mid {
        if chars[i] != chars[n - 1 - i] {
            changesNeeded += 1
        }
    }
    
    // Exit if we need more changes than available
    if changesNeeded > k { return "-1" }
    
    // Calculate remaining changes after making palindrome
    var remainingChanges = k - changesNeeded
    
    // Second pass: Optimize digits to maximize value
    for i in 0..<mid {
        let j = n - 1 - i
        
        if chars[i] != chars[j] {
            // Must change at least one side to make palindrome
            var maxDigit = max(chars[i], chars[j])
            // If we have extra change, make both digits 9
            if remainingChanges > 0 && maxDigit != "9" {
                maxDigit = "9"
                remainingChanges -= 1
            }
            chars[i] = maxDigit
            chars[j] = maxDigit
            continue
        }
        
        // If digits match but aren't 9's and we have 2 changes, make them 9's
        if remainingChanges >= 2 && chars[i] != "9" {
            chars[i] = "9"
            chars[j] = "9"
            remainingChanges -= 2
        }
    }
    
    // Handle middle digit for odd length strings
    if n % 2 == 1 && remainingChanges > 0 && chars[mid] != "9" {
        chars[mid] = "9"
    }
    
    return String(chars)
}