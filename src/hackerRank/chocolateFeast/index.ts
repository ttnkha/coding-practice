/**
 * Calculates the total number of chocolates a person can eat given an initial amount of money,
 * the cost of a single chocolate, and the exchange rate for wrappers.
 *
 * The function accounts for the possibility of exchanging wrappers for free chocolates,
 * and it continues to exchange wrappers as long as the person can get at least one free chocolate.
 *
 * @param n - The initial amount of money the person has (in the same currency as the cost per chocolate).
 * @param c - The cost of a single chocolate.
 * @param m - The number of wrappers required to exchange for one free chocolate.
 * @returns The total number of chocolates the person can eat.
 */
function chocolateFeast(n: number, c: number, m: number): number {
  // Calculate the initial number of chocolates the person can buy
  let chocolatesEaten = Math.floor(n / c);

  // Track the number of wrappers the person has (initially, wrappers are equal to chocolates eaten)
  let wrappers = chocolatesEaten;

  // While the person has enough wrappers to exchange for at least one free chocolate
  while (wrappers >= m) {
    // Calculate how many free chocolates they can get based on their current wrappers
    const freeChocolates = Math.floor(wrappers / m);

    // Add the free chocolates to the total count
    chocolatesEaten += freeChocolates;

    // Update the number of wrappers:
    // - The remaining wrappers after exchanging some for free chocolates
    // - Add the wrappers from the newly obtained free chocolates
    wrappers = (wrappers % m) + freeChocolates;
  }

  // Return the total number of chocolates eaten
  return chocolatesEaten;
}
