func palindromeIndex(s: String) -> Int {
    let chars = Array(s)
    var left = 0
    var right = chars.count - 1
    
    while left < right {
        if chars[left] == chars[right] {
            left += 1
            right -= 1
            continue
        }
        
        if isPalindrome(chars, left: left + 1, right: right) {
            return left
        } else if isPalindrome(chars, left: left, right: right - 1) {
            return right
        } else {
            return -1
        }
    }
    
    return -1
}

func isPalindrome(_ chars: [Character], left: Int, right: Int) -> Bool {
    var l = left
    var r = right
    while l < r {
        if chars[l] != chars[r] {
            return false
        }
        
        l += 1
        r -= 1
    }
    return true
}