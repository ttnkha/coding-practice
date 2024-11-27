/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

function hasCycle(head: ListNode | null): boolean {
  if (head === null) return false;

  let slow = head; // Slow pointer
  let fast = head; // Fast pointer

  // Traverse the list with slow and fast pointers
  while (fast !== null && fast.next !== null) {
    slow = slow.next; // Move slow pointer one step
    fast = fast.next.next; // Move fast pointer two steps

    if (slow === fast) {
      // If slow and fast pointers meet, there is a cycle
      return true;
    }
  }

  // No cycle detected
  return false;
}
