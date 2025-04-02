func funnyString(s: String) -> String {
    let chars = Array(s.utf8)
    let n = chars.count
    
    for i in 0..<(n/2) {
        let forwardDiff = abs(Int(chars[i]) - Int(chars[i+1]))
        let backwardDiff = abs(Int(chars[n-1-i]) - Int(chars[n-2-i]))
        
        if forwardDiff != backwardDiff {
            return "Not Funny"
        }
    }
    
    return "Funny"
}