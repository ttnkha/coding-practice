/**
 * This function determines if it's possible to rearrange ladybugs (represented by characters in the string `b`)
 * such that all ladybugs are happy. A ladybug is happy if there is at least one adjacent ladybug of the same type.
 *
 * - If a ladybug appears exactly once in the string and it does not have an adjacent ladybug of the same type,
 *   then it's impossible to make it happy, and the answer is "NO".
 * - If there are underscores (`_`), they represent empty spaces that can be used to rearrange ladybugs.
 *
 * @param b - A string representing the arrangement of ladybugs and empty spaces.
 * @returns "YES" if all ladybugs can be happy, "NO" otherwise.
 */
function happyLadybugs(b: string): string {
  // A map to count the occurrences of each character (ladybug type)
  let ladybugCount: Record<string, number> = {};

  // Flag to determine if rearranging is required
  let shouldReorder = false;

  // Check adjacent characters (left and right)
  const adjacentOffsets = [1, -1];

  // Loop through each character in the string
  for (let i = 0; i < b.length; i++) {
    const char = b[i];

    // Count the occurrence of each ladybug type (including empty spaces "_")
    ladybugCount[char] = (ladybugCount[char] ?? 0) + 1;

    // If the ladybug has no adjacent ladybug of the same type, it will need to be reordered
    if (!shouldReorder && adjacentOffsets.map((offset) => b[offset + i]).every((c) => c !== char)) {
      shouldReorder = true;
    }
  }

  // Check if it's possible to arrange the ladybugs such that all can be happy
  // The conditions are:
  // 1. A ladybug appears exactly once and has no adjacent ladybug of the same type => "NO"
  // 2. There are no empty spaces ("_") but some ladybugs need to be rearranged => "NO"
  return Object.entries(ladybugCount).some(([char, count]) => {
    return (char !== "_" && count === 1) || (shouldReorder && !ladybugCount["_"]);
  })
    ? "NO"
    : "YES";
}
