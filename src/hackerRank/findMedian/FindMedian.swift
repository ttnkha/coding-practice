/**
 * This function calculates the median of an array of integers.
 * The median is the middle element in the sorted array.
 *
 * @param arr - The input array of integers.
 * @returns The median value as an integer.
 */
func findMedian(arr: [Int]) -> Int {
    // Sort the array in ascending order
    let sortedArray = arr.sorted()

    // Return the middle element of the sorted array
    // If the array has an odd number of elements, it's the middle one
    // If the array has an even number of elements, it will return the lower middle element
    return sortedArray[sortedArray.count / 2]
}
