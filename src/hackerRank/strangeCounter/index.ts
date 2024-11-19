/**
 * This function calculates the value of a strange counter at a given time `t`.
 * The counter starts at 3 and the value decreases every second, but the cycle duration doubles after each full cycle.
 *
 * For example, the counter starts at 3 for 3 seconds, then at 6 for the next 6 seconds, then at 12 for 12 seconds, and so on.
 * The function determines the counter value at a specific time `t`.
 *
 * @param t - The time at which to determine the value of the counter.
 * @returns The value of the counter at time `t`.
 */
function getCounterValueAtTime(t: number): number {
  let num = 3; // Initial counter value at the start of the first cycle
  let i = 1; // The time at which the current cycle ends

  // Find the cycle in which the time `t` falls
  while (t - i > num - 1) {
    i += num; // Move to the next cycle
    num *= 2; // Double the duration of the next cycle
  }

  // Return the counter value at time `t` within the current cycle
  return num - (t - i);
}
