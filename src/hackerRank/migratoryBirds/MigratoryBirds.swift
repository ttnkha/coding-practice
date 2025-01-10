func migratoryBirds(arr: [Int]) -> Int {
    var birdCounts = [Int](repeating: 0, count: 5)
    
    // Count occurrences of each bird type
    for bird in arr {
        birdCounts[bird - 1] += 1
    }
    
    // Find the bird type with the highest count
    let mostFrequentBird = birdCounts.enumerated().max(by: { $0.element < $1.element })!.offset + 1
    
    return mostFrequentBird
}
