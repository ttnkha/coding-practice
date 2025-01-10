func countingValleys(steps: Int, path: String) -> Int {
    var valleyCount = 0
    var altitude = 0
    
    for step in path {
        // Update the altitude based on the current step
        if step == "U" {
            altitude += 1
        } else if step == "D" {
            altitude -= 1
        }
        
        // A valley is counted when we go from below sea level (altitude -1) back to sea level (altitude 0)
        if altitude == 0 && step == "U" {
            valleyCount += 1
        }
    }
    
    return valleyCount
}
