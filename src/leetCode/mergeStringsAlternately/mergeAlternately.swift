class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        let chars1 = Array(word1)
        let chars2 = Array(word2)
        let minLength = min(chars1.count, chars2.count)
        var result = ""

        for i in 0..<minLength {
            result.append(chars1[i])
            result.append(chars2[i])
        }
        result.append(contentsOf: chars1[minLength...])
        result.append(contentsOf: chars2[minLength...])

        return result
    }
}