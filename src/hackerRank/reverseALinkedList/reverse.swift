func reverse(llist: SinglyLinkedListNode?) -> SinglyLinkedListNode? {
    var prev: SinglyLinkedListNode? = nil  // Initialize 'prev' as nil (no node before the first one)
    var current = llist  // 'current' points to the head of the list (the first node)
    
    while current != nil {  // Loop until all nodes are processed
        let nextNode = current?.next  // Store the next node to not lose it after breaking the link
        current?.next = prev  // Reverse the link by making the current node point to the previous node
        prev = current  // Move 'prev' to the current node (for the next iteration)
        current = nextNode  // Move to the next node in the list
    }
    
    return prev  // 'prev' will be the new head of the reversed list
}
