func hackerrankInString(s: String) -> String {
    let word = Array("hackerrank")
    var i = 0
    
    for char in s {
        if i < word.count && char == word[i] {
            i += 1
        }
    }
    
    return i >= word.count ? "YES" : "NO"
}