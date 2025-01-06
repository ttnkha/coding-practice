// Node structure for the prefix tree (trie)
class TrieNode {
    // Dictionary to store child nodes for each character
    var nextChars: [Character: TrieNode] = [:]
    // Flag to mark if this node represents end of a word
    var isWordEnd: Bool = false
}

func noPrefix(words: [String]) -> Void {
    // Initialize root node of prefix tree
    let root = TrieNode()
    
    // Check each word for prefix relationships
    for word in words {
        var current = root
        var isPrefix = false
        
        // Build or traverse prefix tree for current word
        for letter in word {
            // Create new node if path doesn't exist
            if current.nextChars[letter] == nil {
                current.nextChars[letter] = TrieNode()
            }
            
            // Move to next node
            current = current.nextChars[letter]!
            
            // If we hit a word end while building, current word
            // is prefix of an existing word
            if current.isWordEnd {
                isPrefix = true
                break
            }
        }
        
        // Check for bad conditions:
        // 1. Current word is prefix of longer word (isPrefix)
        // 2. Current word has a longer word as prefix (!nextChars.isEmpty)
        if isPrefix || !current.nextChars.isEmpty {
            print("BAD SET")
            print(word)
            return
        }
        
        // Mark current path as a complete word
        current.isWordEnd = true
    }
    
    // If we get here, no prefix relationships were found
    print("GOOD SET")
}