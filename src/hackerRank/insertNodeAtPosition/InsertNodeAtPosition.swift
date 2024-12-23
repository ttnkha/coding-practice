func insertNode(at head: SinglyLinkedListNode?, data: Int, position: Int) -> SinglyLinkedListNode? {
    var current = head
    
    // Traverse to the node just before the target position
    for _ in 0..<position-1 {
        current = current?.next
    }
    
    // Insert the new node
    let newNode = SinglyLinkedListNode(nodeData: data)
    newNode.next = current?.next
    current?.next = newNode
    
    return head
}
