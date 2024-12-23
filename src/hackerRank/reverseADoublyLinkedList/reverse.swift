func reverse(llist: DoublyLinkedListNode?) -> DoublyLinkedListNode? {
    var head: DoublyLinkedListNode? = nil  // This will become the new head of the reversed list
    var curr = llist  // Pointer to the current node, starting at the head of the list
    
    while curr != nil {
        let nextNode = curr?.next  // Store the next node to avoid losing reference to it
        
        // Reverse the 'next' and 'prev' pointers for the current node
        curr?.next = curr?.prev  // Make 'next' point to the previous node
        curr?.prev = nextNode  // Make 'prev' point to the next node
        
        head = curr  // Move the 'head' pointer to the current node (which will be the new head)
        
        curr = nextNode  // Move to the next node (the node we saved earlier)
    }
    
    return head  // The 'head' now points to the new head of the reversed list
}
