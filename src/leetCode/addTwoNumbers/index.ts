// Definition for singly-linked list
class ListNode {
  val: number;
  next: ListNode | null;
  constructor(val?: number, next?: ListNode | null) {
    this.val = val === undefined ? 0 : val;
    this.next = next === undefined ? null : next;
  }
}

function addTwoNumbers(list1: ListNode | null, list2: ListNode | null): ListNode | null {
  // Dummy head node to simplify result list construction
  let dummyHead = new ListNode(0);
  let currentNode = dummyHead; // Pointer to build the result list
  let carry = 0; // Carry-over value for sums greater than 9

  // Loop until both lists are exhausted and no carry remains
  while (list1 || list2 || carry !== 0) {
    // Calculate the sum of the current digits and carry
    const sum = (list1?.val ?? 0) + (list2?.val ?? 0) + carry;

    // Update carry for the next iteration
    carry = Math.floor(sum / 10);

    // Create a new node for the current digit and move the pointer
    currentNode.next = new ListNode(sum % 10);
    currentNode = currentNode.next;

    // Move to the next nodes in the input lists (if any)
    list1 = list1?.next ?? null;
    list2 = list2?.next ?? null;
  }

  // Return the result list, skipping the dummy head node
  return dummyHead.next;
}
