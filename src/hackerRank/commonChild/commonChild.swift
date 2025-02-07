func commonChild(s1: String, s2: String) -> Int {
    let m = s1.count, n = s2.count
    let arr1 = Array(s1), arr2 = Array(s2)
    
    var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
    
    for i in 1...m {
        for j in 1...n {
            if arr1[i - 1] == arr2[j - 1] {
                dp[i][j] = dp[i - 1][j - 1] + 1
            } else {
                dp[i][j] = max(dp[i][j - 1], dp[i - 1][j])
            }
        }
    }
    
    return dp[m][n]
}