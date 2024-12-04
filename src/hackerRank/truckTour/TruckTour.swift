func truckTour(petrolpumps: [[Int]]) -> Int {
    let n = petrolpumps.count  // Get the number of petrol pumps.
    var i = 0  // Initialize the starting index of the pump.
    
    // Iterate through each petrol pump to check if it can be the starting point.
    while (i < n) {
        var gas = 0  // Initialize the gas counter for the current starting pump.
        
        // Check if we can complete the journey starting from pump i.
        for j in 0..<n {
            let currentPetrol = petrolpumps[(i + j) % n]  // Get the petrol values for the current pump in the circular route.
            gas = gas + currentPetrol[0] - currentPetrol[1]  // Add petrol provided and subtract petrol required to move to the next pump.
            
            // If at any point gas is less than 0, it means the truck cannot proceed, so break the loop.
            if gas < 0 {
                break
            }
        }
        
        // If gas is non-negative after the loop, it means the truck can complete the tour starting from this pump.
        if gas >= 0 {
            return i  // Return the starting pump index.
        }
        
        // Otherwise, increment the starting pump index and try again.
        i += 1
    }
    
    return -1  // If no starting point works, return -1 (although this case will not occur if a solution exists).
}
