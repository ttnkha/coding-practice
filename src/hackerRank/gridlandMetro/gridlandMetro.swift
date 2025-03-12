func gridlandMetro(n: Int, m: Int, k: Int, track: [[Int]]) -> Int {
    // If no tracks, all cells are available for lampposts
    if k == 0 {
        return n * m
    }
    
    // Dictionary to store occupied ranges for each row
    var occupiedRanges = [Int: [(start: Int, end: Int)]]()
    
    // Process each track
    for path in track {
        let r = path[0] - 1  // Convert to 0-based indexing
        let c1 = path[1] - 1
        let c2 = path[2] - 1
        
        // Add the range to the row's occupied ranges
        if var ranges = occupiedRanges[r] {
            ranges.append((c1, c2))
            occupiedRanges[r] = ranges
        } else {
            occupiedRanges[r] = [(c1, c2)]
        }
    }
    
    // Calculate occupied cells by merging overlapping ranges
    var occupiedCells = 0
    
    for (_, ranges) in occupiedRanges {
        // Sort ranges by start position
        let sortedRanges = ranges.sorted { $0.start < $1.start }
        
        var mergedRanges = [(start: Int, end: Int)]()
        var currentRange = sortedRanges[0]
        
        for i in 1..<sortedRanges.count {
            let range = sortedRanges[i]
            
            // If ranges overlap, merge them
            if range.start <= currentRange.end + 1 {
                currentRange.end = max(currentRange.end, range.end)
            } else {
                // Add the current merged range and start a new one
                mergedRanges.append(currentRange)
                currentRange = range
            }
        }
        
        // Add the last range
        mergedRanges.append(currentRange)
        
        // Count occupied cells in this row
        for range in mergedRanges {
            occupiedCells += range.end - range.start + 1
        }
    }
    
    // Total cells minus occupied cells
    return n * m - occupiedCells
}