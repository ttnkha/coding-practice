func climbingLeaderboard(ranked: [Int], player: [Int]) -> [Int] {
    var result = [Int](repeating: 0, count: player.count) // Initialize result array to store rankings for each player
    var currentRank = 1  // Start from rank 1
    var i = 0  // Index for the ranked array
    var j = player.count - 1  // Index for the player array, starting from the last player
    
    // Iterate through the ranked array to assign ranks to players
    while i < ranked.count {
        let rank = ranked[i]
        
        // If the player's score is greater than or equal to the current rank, assign the current rank to the player
        while j >= 0 && player[j] >= rank {
            result[j] = currentRank
            j -= 1  // Move to the next player
        }
        
        // If all players have been assigned ranks, exit the loop
        if j < 0 { break }
        
        // If the next rank is different from the current one, increment the rank
        if i < ranked.count - 1 && rank != ranked[i + 1] {
            currentRank += 1
        }
        
        i += 1  // Move to the next rank in the ranked list
    }
    
    // For remaining players who haven't been ranked, assign them the next possible rank
    while j >= 0 {
        result[j] = currentRank + 1  // Players who haven't been assigned a rank get the lowest rank
        j -= 1  // Move to the next player
    }
    
    return result  // Return the final array of player rankings
}
