/**
 * This function calculates the proportions of positive, negative, and zero elements 
 * in an array of integers and prints them.
 *
 * @param arr - The input array of integers to be analyzed.
 */
func plusMinus(arr: [Int]) {
    var positive = 0
    var negative = 0
    var zero = 0
    
    // Loop through the array and count positive, negative, and zero numbers
    for num in arr {
        if num > 0 {
            positive += 1
        } else if num < 0 {
            negative += 1
        } else {
            zero += 1
        }
    }

    let totalCount = Double(arr.count)

    // Print the proportions of positive, negative, and zero values
    print(String(format: "%.6f", Double(positive) / totalCount))
    print(String(format: "%.6f", Double(negative) / totalCount))
    print(String(format: "%.6f", Double(zero) / totalCount))
}
