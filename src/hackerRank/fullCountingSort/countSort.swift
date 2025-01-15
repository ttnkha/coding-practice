func countSort(arr: [[String]]) -> Void {
    let result = arr.enumerated()
        .sorted(by: { Int($0.element[0])! < Int($1.element[0])! })
        .map { $0.offset < arr.count / 2 ? "-" : $0.element[1] }
        .joined(separator: " ")
    
    print(result)
}

func countSort2(arr: [[String]]) {
    let n = arr.count
    let maxIdx = arr.map { Int($0[0])! }.max()!
    
    var buckets = Array(repeating: [String](), count: maxIdx + 1)
    for i in 0..<n {
        let idx = Int(arr[i][0])!
        buckets[idx].append(i < n/2 ? "-" : arr[i][1])
    }
    
    print(buckets.flatMap { $0 }.joined(separator: " "))
}