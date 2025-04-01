func marsExploration(s: String) -> Int {
    var count = 0
    
    for (index, char) in s.enumerated() {
        if char != Array("SOS")[(index % 3)] {
            count += 1
        }
    }
    
    return count
}
