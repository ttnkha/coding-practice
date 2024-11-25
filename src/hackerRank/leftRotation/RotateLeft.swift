func rotateLeft(d: Int, arr: [Int]) -> [Int] {
    return Array(arr[d...] + arr[..<d])
}
