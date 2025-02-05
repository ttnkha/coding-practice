func largestRectangle(h: [Int]) -> Int {
    var largestRect = 0
    
    // Iterate through each bar to find the largest possible rectangle
    for i in 0..<h.count {
        var left = i
        
        // Expand left while bars are taller or equal to the current bar
        while left >= 0, h[left] >= h[i] {
            left -= 1
        }
        
        var right = i
        
        // Expand right while bars are taller or equal to the current bar
        while right < h.count, h[right] >= h[i] {
            right += 1
        }
        
        // Calculate the area of the rectangle with height h[i]
        let rect = h[i] * (right - left - 1)
        
        // Update the maximum rectangle area found so far
        largestRect = max(largestRect, rect)
    }
    
    return largestRect
}