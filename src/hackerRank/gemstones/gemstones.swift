func gemstones(arr: [String]) -> Int {
    let uniqueStones = arr.map { String(Set(Array($0))) }
    var minerals = [Character: Int]()
    
    for stone in uniqueStones {
        for mineral in stone {
            minerals[mineral, default: 0] += 1
        }
    }
    
    return minerals.values.filter { $0 == arr.count }.count
}

func gemstonesAiVersion(arr: [String]) -> Int {
    guard !arr.isEmpty else { return 0 }
    
    // Create a set from the first string
    var commonMinerals = Set(Array(arr[0]))
    
    // Iterate through remaining strings and keep only minerals that appear in all
    for i in 1..<arr.count {
        commonMinerals = commonMinerals.intersection(Set(Array(arr[i])))
    }
    
    return commonMinerals.count
}