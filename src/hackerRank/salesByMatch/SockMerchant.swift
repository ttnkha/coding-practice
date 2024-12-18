func sockMerchant(n: Int, socks: [Int]) -> Int {
    // Create a dictionary to count the occurrences of each type of sock
    let sockCounts = socks.reduce(into: [Int: Int]()) { counts, sock in
        counts[sock, default: 0] += 1
    }
    
    // Calculate the number of pairs by summing the counts divided by 2
    return sockCounts.values.reduce(0) { $0 + $1 / 2 }
}
