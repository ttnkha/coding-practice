/**
 * Calculates the ranks of players based on their scores against a ranked leaderboard.
 *
 * The function processes the leaderboard scores to determine the rank of each player.
 *
 * @param {number[]} ranked - An array of integers representing the scores on the leaderboard.
 * @param {number[]} player - An array of integers representing the scores of the players.
 * @returns {number[]} An array of integers representing the ranks of the players in the leaderboard.
 */
function climbingLeaderboard(rankedScores, playerScores) {
  // Create a unique list of ranked scores
  let uniqueRankedScores = [0]; // Starting with 0 to avoid index confusion
  for (const score of rankedScores) {
    // Add the score if it's not already in the unique list
    if (uniqueRankedScores[uniqueRankedScores.length - 1] !== score) {
      uniqueRankedScores.push(score);
    }
  }

  const playerRanks = [];
  // Determine the rank for each player's score
  for (const score of playerScores) {
    let left = 1;
    let right = uniqueRankedScores.length - 1;
    let rank;

    // Binary search to find the rank
    while (left <= right) {
      const mid = Math.floor((left + right) / 2);
      if (score === uniqueRankedScores[mid]) {
        rank = mid; // Exact match
        break;
      }
      if (score > uniqueRankedScores[mid]) {
        rank = mid; // Higher score means this rank is valid
        right = mid - 1; // Search left for lower ranks
      } else {
        left = mid + 1; // Search right for higher scores
      }
    }

    // If no exact match, set the rank
    if (rank === undefined) {
      rank = left; // The rank should be the position found in the sorted array
    }

    playerRanks.push(rank);
  }

  return playerRanks;
}
