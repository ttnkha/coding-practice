func superDigit(n: String, k: Int) -> Int {
    var digitSum = n.reduce(0) { $0 + Int(String($1))! } * k

    // Reduce the sum until it becomes a single-digit number
    while digitSum > 10 {
        digitSum = String(digitSum).reduce(0) { $0 + Int(String($1))! }
    }

    return digitSum
}