func breakingRecords(scores: [Int]) -> [Int] {
    guard let first = scores.first else { return [0, 0] }
    return scores.reduce(([0, 0], [first, first])) { acc, score in
        let (counts, records) = acc
        return (
            [
                counts[0] + (score > records[0] ? 1 : 0),
                counts[1] + (score < records[1] ? 1 : 0)
            ],
            [max(score, records[0]), min(score, records[1])]
        )
    }.0
}