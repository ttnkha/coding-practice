func pageCount(totalPages: Int, targetPage: Int) -> Int {
    // Calculate the minimum flips from the beginning of the book
    let flipsFromBeginning = targetPage / 2
    
    // Calculate the minimum flips from the end of the book
    let flipsFromEnd = (totalPages / 2 - targetPage / 2)
    
    // Return the minimum number of flips required
    return min(flipsFromBeginning, flipsFromEnd)
}
