func sherlockAndAnagrams(s: String) -> Int {
    var count = 0
    let chars = Array(s)
    
    for len in 1..<s.count {
        var substringFreq: [[Character: Int]: Int] = [:]
        
        for start in 0...(s.count - len) {
            let substring = chars[start..<(start + len)]
            let freq = Dictionary(substring.map { ($0, 1) }, uniquingKeysWith: +)
            substringFreq[freq, default: 0] += 1
        }
        
        count += substringFreq.values.reduce(0) { $0 + ($1 * ($1 - 1)) / 2 }
    }
    
    return count
}