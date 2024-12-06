func birthday(s: [Int], d: Int, m: Int) -> Int {
    var count = 0
    var currentSum = s.prefix(m).reduce(0, +)  // Initial sum of the first subarray

    if currentSum == d { count += 1 }

    // Slide the window across the array
    for i in m..<s.count {
        currentSum += s[i] - s[i - m]  // Add the next element and remove the first element
        if currentSum == d { count += 1 }
    }
    
    return count
}
