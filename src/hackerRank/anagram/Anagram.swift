func anagram(s: String) -> Int {
    // If the string has an odd length, it's impossible to split into two equal halves
    if s.count % 2 == 1 {
        return -1
    }
    
    // Split the string into two halves
    let middleIndex = s.count / 2
    let firstHalf = Array(s.prefix(middleIndex))
    let secondHalf = Array(s.suffix(middleIndex))
    
    // Calculate the frequency of each character in both halves
    let firstHalfFreq = firstHalf.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
    let secondHalfFreq = secondHalf.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
    
    // Calculate how many characters need to be changed to make the two halves anagrams
    var changesRequired = 0
    for (char, count) in firstHalfFreq {
        changesRequired += max(0, count - (secondHalfFreq[char, default: 0]))
    }
    
    return changesRequired
}
