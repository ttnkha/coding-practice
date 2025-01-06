/// A MinHeap data structure implementation that maintains the minimum element at the root.
/// The heap property ensures that a parent node is always smaller than or equal to its children.
class MinHeap {
    // The underlying array that stores the heap elements
    private var items: [Int] = []
    
    /// Returns true if the heap is empty, false otherwise
    var isEmpty: Bool { items.isEmpty }
    
    /// Returns the minimum element without removing it, or nil if the heap is empty
    var peek: Int? { items.first }
    
    /// Inserts a new element into the heap
    /// - Parameter item: The element to insert
    /// - Complexity: O(log n), where n is the number of elements in the heap
    func insert(_ item: Int) {
        items.append(item)
        // After adding the item at the end, we need to restore the heap property
        siftUp(at: items.count - 1)
    }
    
    /// Removes and returns the minimum element from the heap
    /// - Returns: The minimum element, or nil if the heap is empty
    /// - Complexity: O(log n), where n is the number of elements in the heap
    func removeMin() -> Int? {
        guard !items.isEmpty else { return nil }
        // If there's only one item, just remove and return it
        if items.count == 1 {
            return items.removeLast()
        }
        
        // Store the minimum element to return later
        let min = items[0]
        // Move the last element to the root
        items[0] = items.removeLast()
        // Restore the heap property
        siftDown(at: 0)
        return min
    }
    
    /// Moves an element up the heap until it's in the correct position
    /// - Parameter index: The index of the element to move up
    /// - Complexity: O(log n), where n is the number of elements in the heap
    private func siftUp(at index: Int) {
        var child = index
        // Calculate the parent index
        var parent = (child - 1) / 2
        
        // Continue while we haven't reached the root and the child is smaller than its parent
        while child > 0 && items[child] < items[parent] {
            // Swap the child with its parent
            items.swapAt(child, parent)
            // Move up to the parent level
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    /// Moves an element down the heap until it's in the correct position
    /// - Parameter index: The index of the element to move down
    /// - Complexity: O(log n), where n is the number of elements in the heap
    private func siftDown(at index: Int) {
        var parent = index
        
        while true {
            // Calculate indices for left and right children
            let leftChild = 2 * parent + 1
            let rightChild = leftChild + 1
            var candidate = parent
            
            // Check if the left child is smaller than the current candidate
            if leftChild < items.count && items[leftChild] < items[candidate] {
                candidate = leftChild
            }
            
            // Check if the right child is smaller than the current candidate
            if rightChild < items.count && items[rightChild] < items[candidate] {
                candidate = rightChild
            }
            
            // If the parent is already smaller than both children, we're done
            if candidate == parent {
                return
            }
            
            // Swap the parent with the smaller child
            items.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

/// Solves the cookie sweetness problem by combining the smallest cookies until they meet the required sweetness
/// - Parameters:
///   - k: The minimum required sweetness level
///   - A: Array of initial cookie sweetness values
/// - Returns: The minimum number of operations needed to get a cookie with sweetness >= k, or -1 if impossible
/// - Complexity: O(n log n), where n is the number of cookies
func cookies(k: Int, A: [Int]) -> Int {
    var heap = MinHeap()
    // Insert all cookies into the min heap
    for cookie in A {
        heap.insert(cookie)
    }
    
    var operations = 0
    while !heap.isEmpty {
        // Get the least sweet cookie
        guard let least = heap.removeMin() else { break }
        // If the least sweet cookie meets the requirement, we're done
        if least >= k { return operations }
        
        // Get the second least sweet cookie
        guard let nextLeast = heap.removeMin() else { break }
        
        // Combine cookies according to the formula: least + (2 * nextLeast)
        heap.insert(least + 2 * nextLeast)
        operations += 1
    }
    
    // Check if the final cookie meets the requirement
    if let final = heap.peek, final >= k {
        return operations
    }
    
    // If we can't achieve the required sweetness, return -1
    return -1
}