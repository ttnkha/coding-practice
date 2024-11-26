/**
 * This function calculates the minimum and maximum sums of four elements from the array,
 * and prints them. The minimum sum is the sum of the smallest four elements, and the maximum 
 * sum is the sum of the largest four elements.
 *
 * @param arr - The input array of integers.
 */
func miniMaxSum(arr: [Int]) {
    // Sort the array in ascending order to easily access the smallest and largest elements
    let sortedArr = arr.sorted()

    // Calculate the sum of the smallest four elements (minSum)
    let minSum = sortedArr.prefix(4).reduce(0, +)

    // Calculate the sum of the largest four elements (maxSum)
    let maxSum = sortedArr.suffix(4).reduce(0, +)

    // Print the minimum and maximum sums
    print(minSum, maxSum)
}
