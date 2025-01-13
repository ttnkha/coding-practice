func minimumAbsoluteDifference(arr: [Int]) -> Int {
    let sorted = arr.sorted()
    return zip(sorted, sorted.dropFirst()).map { abs($1 - $0) }.min()!
}