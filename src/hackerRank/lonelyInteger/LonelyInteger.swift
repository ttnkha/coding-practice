// Function to find the lonely integer in an array
// A lonely integer is an integer that appears exactly once in the array,
// while all other integers appear twice.

func lonelyInteger(numbers: [Int]) -> Int {
    var frequencyMap: [Int: Int] = [:]  // Dictionary to track the frequency of each number in the array
    
    // Loop through each number in the array and update its count in the frequencyMap
    for number in numbers {
        frequencyMap[number, default: 0] += 1
    }
    
    // Find and return the number that has a frequency of 1 (the lonely integer)
    return frequencyMap.first { $0.value == 1 }!.key
}
