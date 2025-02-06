func almostSorted(arr: [Int]) {
    let sortedArr = arr.sorted()
    
    if arr == sortedArr {
        print("yes")
        return
    }
    
    let n = arr.count
    var l = -1, r = -1
    
    // Find the first and last indices where arr differs from sortedArr
    for i in 0..<n {
        if arr[i] != sortedArr[i] {
            if l == -1 { l = i }
            r = i
        }
    }
    
    // Try swapping l and r
    var swappedArr = arr
    swappedArr.swapAt(l, r)
    if swappedArr == sortedArr {
        print("yes")
        print("swap \(l + 1) \(r + 1)")  // Convert to 1-based index
        return
    }
    
    // Try reversing the subarray between l and r
    var reversedArr = arr
    reversedArr[l...r].reverse()
    if reversedArr == sortedArr {
        print("yes")
        print("reverse \(l + 1) \(r + 1)")  // Convert to 1-based index
        return
    }
    
    // If neither swap nor reverse fixes the array, print "no"
    print("no")
}
