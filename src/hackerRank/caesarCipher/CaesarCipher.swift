func caesarCipher(s: String, k: Int) -> String {
    var result = ""
    
    for char in s {
        if !char.isLetter {  // If the character is not a letter, append it as is.
            result.append(char)
            continue
        }

        // Determine the base ASCII value ('A' for uppercase, 'a' for lowercase)
        let base = Character(char.isUppercase ? "A" : "a")
        let baseOffset = Int(base.asciiValue!)  // This gives the ASCII value for 'A' or 'a'
        
        // Calculate the new character by shifting and wrapping around the alphabet
        let newChar = Character(UnicodeScalar((Int(char.asciiValue!) - baseOffset + k) % 26 + baseOffset)!) 
        
        result.append(newChar)
    }

    return result
}
