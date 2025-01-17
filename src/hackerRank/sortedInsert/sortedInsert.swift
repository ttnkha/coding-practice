func sortedInsert(llist: DoublyLinkedListNode?, data: Int) -> DoublyLinkedListNode? {
    let newNode = DoublyLinkedListNode(nodeData: data)
    
    // Insert at beginning if list is empty or data is smaller than first node
    guard let head = llist, head.data <= data else {
        newNode.next = llist
        return newNode
    }
    
    // Find insertion point
    var current = head
    while let next = current.next, next.data <= data {
        current = next
    }
    
    newNode.next = current.next
    current.next = newNode
    return llist
}