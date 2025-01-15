func gamingArray(arr: [Int]) -> String {
    var step = 0
    var maxNum = Int.min
    for num in arr {
        if num > maxNum {
            maxNum = num
            step += 1
        }
    }
    return step % 2 == 1 ? "BOB" : "ANDY"
}