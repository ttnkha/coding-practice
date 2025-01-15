func missingNumbers(arr: [Int], brr: [Int]) -> [Int] {
    let freqA = arr.reduce(into: [Int: Int]()) { $0[$1, default: 0] += 1 }
    let freqB = brr.reduce(into: [Int: Int]()) { $0[$1, default: 0] += 1 }

    var result: [Int] = []

    for (key, valueB) in freqB {
        let valueA = freqA[key, default: 0]
        if valueB != valueA {
            result.append(key)
        }
    }

    return result.sorted()
}