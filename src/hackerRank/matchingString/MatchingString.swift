/**
 * Given a list of strings and a list of queries, this function returns an array where
 * each element represents the count of occurrences of the query string in the stringList.
 *
 * @param stringList - An array of strings to search within.
 * @param queries - An array of query strings whose occurrences are to be counted.
 * @returns An array of integers representing the occurrence count of each query in stringList.
 */
func matchingStrings(stringList: [String], queries: [String]) -> [Int] {
    // Create a dictionary to store the frequency of each string in stringList.
    var frequencyMap: [String: Int] = [:]

    // Populate the frequency map with counts of each string in stringList.
    for str in stringList {
        frequencyMap[str, default: 0] += 1
    }

    // For each query, append the corresponding count from the frequency map (or 0 if not found).
    return queries.map { frequencyMap[$0, default: 0] }
}

func matchingStringsV2(strings: [String], queries: [String]) -> [Int] {
    let frequencyMap = strings.reduce(into: [String: Int]()) {
        $0[$1, default: 0] += 1
    }
    return queries.map { frequencyMap[$0, default: 0] }
}