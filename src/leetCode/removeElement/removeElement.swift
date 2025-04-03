class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        let n = nums.count
        var k = 0
        var i = 0
        var j = n - 1
        
        while i <= j {
            if nums[i] != val {
                k += 1
                i += 1
                continue
            }
            if nums[j] == val {
                j -= 1
                continue
            }
            nums.swapAt(i, j)
            k += 1
            i += 1
            j -= 1
        }

        return k
    }
}