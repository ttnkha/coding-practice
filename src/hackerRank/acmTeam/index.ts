/**
 * Function to calculate the maximum number of topics two people can collectively know and the number of teams
 * that can achieve this maximum number of topics.
 *
 * The function takes in a list of binary strings where each string represents the topics a person knows.
 * The function computes the maximum number of topics two people can jointly know (using the bitwise OR operation),
 * and counts how many unique pairs of people know that maximum number of topics.
 *
 * @param topics - An array of binary strings where each string represents the topics known by a person.
 *                Each '1' represents knowledge of a topic, and '0' represents lack of knowledge.
 *
 * @returns An array of two integers:
 *          - The first element is the maximum number of topics a 2-person team can collectively know.
 *          - The second element is the number of 2-person teams that can achieve this maximum number of topics.
 */
function acmTeam(topics: string[]): number[] {
  let maxTopics = 0; // To store the maximum number of topics known by any team
  let teamCount = 0; // To count how many teams can know the maximum number of topics

  // Iterate through all unique pairs of people
  for (let i = 0; i < topics.length - 1; i++) {
    for (let j = i + 1; j < topics.length; j++) {
      let commonTopics = 0; // To store the number of topics known by both people in the pair

      // Check each topic (bitwise OR) to see if either person knows the topic
      for (let k = 0; k < topics[i].length; k++) {
        if (topics[i][k] === "1" || topics[j][k] === "1") {
          commonTopics++; // Increment if either person knows the topic
        }
      }

      // If this team knows more topics than the previous maximum, update maxTopics and reset teamCount
      if (commonTopics > maxTopics) {
        maxTopics = commonTopics;
        teamCount = 1; // Found a new team with a higher count, reset the count to 1
      }
      // If this team knows the same number of topics as the maximum, increment the count
      else if (commonTopics === maxTopics) {
        teamCount++;
      }
    }
  }

  return [maxTopics, teamCount]; // Return the results: max topics and the number of teams with max topics
}
