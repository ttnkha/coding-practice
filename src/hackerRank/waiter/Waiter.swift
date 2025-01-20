func waiter(number: [Int], q: Int) -> [Int] {
    var answers: [Int] = []
    var A = number  // Starting stack of plates
    var prime = 2    // Start with the first prime number
    
    // Function to check if a number is prime
    func isPrime(_ n: Int) -> Bool {
        if n <= 1 { return false }
        if n == 2 { return true }
        if n % 2 == 0 { return false }
        for i in 3..<n where i * i <= n {
            if n % i == 0 {
                return false
            }
        }
        return true
    }
    
    // Function to get the next prime number greater than the current prime
    func nextPrime(after n: Int) -> Int {
        var current = n + 1
        while !isPrime(current) {
            current += 1
        }
        return current
    }
    
    // Iterate over the number of rounds (q)
    for i in 0..<q {
        var newA: [Int] = []   // Plates that will stay in A
        var B: [Int] = []      // Plates divisible by the current prime
        
        // Separate plates into B (divisible by prime) and newA (remaining plates)
        for plate in A {
            if plate % prime == 0 {
                B.append(plate)
            } else {
                newA.append(plate)
            }
        }
        
        // Add the plates in B to the answer (in reversed order)
        answers.append(contentsOf: i % 2 == 0 ? B : B.reversed())
        A = newA  // Update A with the remaining plates
        
        // Find the next prime number
        prime = nextPrime(after: prime)
    }
    
    // Add the remaining plates in A to the answer (in reversed order)
    answers.append(contentsOf: q % 2 == 0 ? A.reversed() : A)
    
    return answers
}
