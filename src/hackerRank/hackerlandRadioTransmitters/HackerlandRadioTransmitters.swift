/// Calculates minimum number of transmitters needed to cover all houses
/// - Parameters:
///   - x: Array of house positions on a line
///   - k: Range of each transmitter (can cover k units left and right)
/// - Returns: Minimum number of transmitters needed
func hackerlandRadioTransmitters(x: [Int], k: Int) -> Int {
    // Sort houses to process them in order from left to right
    var houses = x.sorted()
    var transmitterCount = 0
    var i = 0
    
    // Continue until all houses are processed
    while i < houses.count {
        // Get leftmost uncovered house position
        let currentHouse = houses[i]
        
        // Find rightmost house within k units to the right
        // This helps find optimal transmitter placement
        while i < houses.count, houses[i] <= currentHouse + k {
            i += 1
        }
        
        // Place transmitter at rightmost house within first range
        // This maximizes coverage for next set of houses
        var transmitterPosition = houses[i - 1]
        
        // Skip all houses covered by current transmitter's range
        // A transmitter at position p covers houses from p to p+k
        while i < houses.count, houses[i] <= transmitterPosition + k {
            i += 1
        }
        
        // Increment count after placing each transmitter
        transmitterCount += 1
    }
    
    return transmitterCount
}