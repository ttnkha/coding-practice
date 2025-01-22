func chiefHopper(arr: [Int]) -> Int {
    return arr.reversed().reduce(0) { Int(ceil(Double($0 + $1) / 2.0)) }
}