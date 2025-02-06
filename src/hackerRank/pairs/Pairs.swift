func pairs(k: Int, arr: [Int]) -> Int {
    // Create a dictionary to store the frequency of each element in the array `arr`.
    var map: [Int: Int] = [:]
    
    // Iterate through each number in the array and update the frequency of that number in the dictionary.
    for num in arr {
        map[num, default: 0] += 1
    }
    
    // Sort the array to ensure we are checking pairs in an ordered manner (from largest to smallest).
    // This helps avoid double-counting and ensures the difference calculation is consistent.
    let sorted = arr.sorted()
    
    // Initialize a counter to track the number of valid pairs.
    var count = 0
    
    // For each number in the sorted array, calculate the remaining number (`remaining`) needed to form a valid pair with difference `k`.
    for i in (0..<(sorted.count)).reversed() {
        let remaining = sorted[i] - k
        
        // If `remaining` is present in the map, it means we have found valid pairs.
        if let sequence = map[remaining] {
            count += sequence
        }
    }
    
    // Return the total number of valid pairs.
    return count
}

func pairsV2(k: Int, arr: [Int]) -> Int {
    let frequencies = arr.reduce(into: [Int: Int]()) { $0[$1, default: 0] += 1 }
    return arr.reduce(0) { $0 + frequencies[$1 + k, default: 0] }
}