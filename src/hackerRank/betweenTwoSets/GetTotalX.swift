func getTotalX(divisors: [Int], multiples: [Int]) -> Int {
    var count = 0
    let maxDivisor = divisors.max()!
    let minMultiple = multiples.min()!
    
    // Check each number between max divisor and min multiple
    for candidate in stride(from: maxDivisor, to: minMultiple + 1, by: maxDivisor) {
        if divisors.allSatisfy({ candidate % $0 == 0 }) && multiples.allSatisfy({ $0 % candidate == 0 }) {
            count += 1
        }
    }
    
    return count
}
