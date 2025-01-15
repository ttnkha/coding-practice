func minimumNumber(n: Int, password: String) -> Int {
    let requirements: [(Character) -> Bool] = [
        { $0.isNumber },
        { $0.isLowercase },
        { $0.isUppercase }
    ]
    
    var needToAddCharacters = requirements.filter { requirement in
        !password.contains(where: requirement)
    }.count
    
    let specialCharacters = "!@#$%^&*()-+"
    if !password.contains(where: { specialCharacters.contains($0) }) {
        needToAddCharacters += 1
    }

    // Ensure the password is at least 6 characters long
    return max(6 - n, needToAddCharacters)
}
