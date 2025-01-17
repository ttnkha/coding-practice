func removeDuplicates(llist: SinglyLinkedListNode?) -> SinglyLinkedListNode? {
    // Start with the head of the list
    var current = llist
    
    // Traverse through the list until we reach the end
    while current != nil {
        // If current node and next node have same value
        while current?.data == current?.next?.data {
            // Skip the duplicate node by updating the next pointer
            // to point to the node after next
            current?.next = current?.next?.next
        }
        
        // If no duplicate, move to next node
        current = current?.next
    }
    
    // Return the head of the modified list
    return llist
}