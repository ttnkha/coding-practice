// Function to perform counting sort
// arr: An array of integers to be sorted, where each integer is in the range [0, 99]
// Returns an array where the index represents the value, and the value at that index is the frequency of that value in the input array

func countingSort(inputArray: [Int]) -> [Int] {
    // Create an array of size 100 to store the frequency of each integer (0 to 99)
    var frequencyArray = Array(repeating: 0, count: 100)
    
    // Count the occurrences of each number in the input array
    for number in inputArray {
        frequencyArray[number] += 1
    }
    
    // Return the frequency array as the result of the counting sort
    return frequencyArray
}
