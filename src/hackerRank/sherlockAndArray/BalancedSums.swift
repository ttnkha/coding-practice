func balancedSums(arr: [Int]) -> String {
    var leftIndex = 0
    var rightIndex = arr.count - 1
    var leftSum = arr[leftIndex]
    var rightSum = arr[rightIndex]

    // Move towards the center of the array, adjusting sums
    while leftIndex < rightIndex {
        if leftSum < rightSum {
            leftIndex += 1
            leftSum += arr[leftIndex]
        } else if leftSum > rightSum {
            rightIndex -= 1
            rightSum += arr[rightIndex]
        } else {
            leftIndex += 1
            rightIndex -= 1
            leftSum += arr[leftIndex]
            rightSum += arr[rightIndex]
        }
    }

    // Return result based on balanced sum condition
    return leftSum == rightSum ? "YES" : "NO"
}
