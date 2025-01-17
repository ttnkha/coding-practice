func superReducedString(s: String) -> String {
    var characters = Array(s)
    
    var i = 0
    while i < characters.count - 1 {
        if characters[i] != characters[i + 1] {
            i += 1
            continue
        }
        characters.remove(at: i)
        characters.remove(at: i)
        i = max(i - 1, 0)
    }
    
    return characters.isEmpty ? "Empty String" : String(characters)
}

func superReducedStringV2(s: String) -> String {
    var result = ""
    for char in s {
        if let last = result.last, last == char {
            result.removeLast()
        } else {
            result.append(char)
        }
    }
    return result.isEmpty ? "Empty String" : result
}