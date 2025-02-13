class TrieNode {
    private var nextChars: [Character: TrieNode] = [:]
    private var wordCount: Int = 0
    
    func insert(_ word: String) {
        var current = self
        
        for char in word {
            if current.nextChars[char] == nil {
                current.nextChars[char] = TrieNode()
            }
            current = current.nextChars[char]!
            current.wordCount += 1
        }
    }
    
    func findCount(for prefix: String) -> Int {
        var current = self
        
        for char in prefix {
            guard let next = current.nextChars[char] else {
                return 0
            }
            current = next
        }
        
        return current.wordCount
    }
}

func contacts(queries: [[String]]) -> [Int] {
    let root = TrieNode()
    var result: [Int] = []
    
    for query in queries {
        let action = query[0]
        let value = query[1]
        
        switch action {
            case "add": root.insert(value)
            case "find": result.append(root.findCount(for: value))
            default: continue
        }
    }
    
    return result
}