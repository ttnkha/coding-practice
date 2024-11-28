function mergeTwoLists(list1: ListNode | null, list2: ListNode | null): ListNode | null {
  let head = new ListNode(0); // Dummy node to simplify handling the head of the merged list
  let current = head; // Pointer to track the current node in the merged list

  while (list1 || list2) {
    if (!list1) {
      // If list1 is exhausted, append the remainder of list2
      current.next = list2;
      break;
    }

    if (!list2) {
      // If list2 is exhausted, append the remainder of list1
      current.next = list1;
      break;
    }

    // Compare the current values of both lists
    if (list1.val <= list2.val) {
      current.next = list1; // Attach list1's node to the merged list
      list1 = list1.next; // Move to the next node in list1
    } else {
      current.next = list2; // Attach list2's node to the merged list
      list2 = list2.next; // Move to the next node in list2
    }

    // Move the current pointer to the next node
    current = current.next;
  }

  return head.next; // Return the merged list, skipping the dummy node
}
