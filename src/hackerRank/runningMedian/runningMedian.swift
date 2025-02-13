/// MinHeap class for maintaining a min-heap structure.
/// The smallest element is always at the root.
class MinHeap {
    private var items: [Double] = [] // Internal array to hold heap elements.

    /// Returns true if the heap is empty.
    var isEmpty: Bool { items.isEmpty }

    /// Returns the smallest element in the heap (root).
    var peek: Double? { items.first }

    /// Returns the number of elements in the heap.
    var count: Int { items.count }

    /// Inserts a new element into the heap.
    func insert(_ item: Double) {
        items.append(item)
        siftUp(at: items.count - 1)
    }

    /// Removes and returns the smallest element (root) from the heap.
    func removeMin() -> Double? {
        guard !items.isEmpty else { return nil }
        if items.count == 1 {
            return items.removeLast()
        }

        let min = items[0]
        items[0] = items.removeLast() // Replace root with the last element.
        siftDown(at: 0)
        return min
    }

    /// Restores the heap property by moving an element up the tree.
    private func siftUp(at index: Int) {
        var child = index
        var parent = (child - 1) / 2

        while child > 0 && items[child] < items[parent] {
            items.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    /// Restores the heap property by moving an element down the tree.
    private func siftDown(at index: Int) {
        var parent = index

        while true {
            let leftChild = 2 * parent + 1
            let rightChild = leftChild + 1
            var candidate = parent

            if leftChild < items.count && items[leftChild] < items[candidate] {
                candidate = leftChild
            }

            if rightChild < items.count && items[rightChild] < items[candidate] {
                candidate = rightChild
            }

            if candidate == parent {
                return
            }

            items.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

/// MaxHeap class for maintaining a max-heap structure.
/// The largest element is always at the root.
class MaxHeap {
    private var items: [Double] = [] // Internal array to hold heap elements.

    /// Returns true if the heap is empty.
    var isEmpty: Bool { items.isEmpty }

    /// Returns the largest element in the heap (root).
    var peek: Double? { items.first }

    /// Returns the number of elements in the heap.
    var count: Int { items.count }

    /// Inserts a new element into the heap.
    func insert(_ item: Double) {
        items.append(item)
        siftUp(at: items.count - 1)
    }

    /// Removes and returns the largest element (root) from the heap.
    func removeMax() -> Double? {
        guard !items.isEmpty else { return nil }
        if items.count == 1 {
            return items.removeLast()
        }

        let max = items[0]
        items[0] = items.removeLast() // Replace root with the last element.
        siftDown(at: 0)
        return max
    }

    /// Restores the heap property by moving an element up the tree.
    private func siftUp(at index: Int) {
        var child = index
        var parent = (child - 1) / 2

        while child > 0 && items[child] > items[parent] {
            items.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    /// Restores the heap property by moving an element down the tree.
    private func siftDown(at index: Int) {
        var parent = index

        while true {
            let leftChild = 2 * parent + 1
            let rightChild = leftChild + 1
            var candidate = parent

            if leftChild < items.count && items[leftChild] > items[candidate] {
                candidate = leftChild
            }

            if rightChild < items.count && items[rightChild] > items[candidate] {
                candidate = rightChild
            }

            if candidate == parent {
                return
            }

            items.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

/// RunningMedian class for calculating the running median of a stream of numbers.
/// It uses a max-heap for the lower half and a min-heap for the upper half of the numbers.
class RunningMedian {
    private var uppers = MinHeap() // Min-heap to store the larger half of the numbers.
    private var lowers = MaxHeap() // Max-heap to store the smaller half of the numbers.

    /// Adds a new number to the data structure.
    func add(_ number: Double) {
        if lowers.count == 0 {
            lowers.insert(number)
            return
        }

        if number < getMedian() {
            lowers.insert(number)
        } else {
            uppers.insert(number)
        }

        // Balance the heaps to ensure their sizes differ by at most 1.
        if lowers.count > uppers.count + 1 {
            if let max = lowers.removeMax() {
                uppers.insert(max)
            }
        } else if uppers.count > lowers.count {
            if let min = uppers.removeMin() {
                lowers.insert(min)
            }
        }
    }

    /// Returns the current median of the numbers.
    func getMedian() -> Double {
        if lowers.count == uppers.count {
            if let lower = lowers.peek, let upper = uppers.peek {
                return (lower + upper) / 2
            }
        }

        return lowers.peek ?? 0.0 // Default to 0.0 if no elements exist.
    }
}

/// Function to compute the running median for a given array of integers.
/// - Parameter a: The input array of integers.
/// - Returns: An array of doubles representing the running median at each step.
func runningMedian(a: [Int]) -> [Double] {
    let rm = RunningMedian()
    return (0..<a.count).map {
        rm.add(Double(a[$0]))
        return rm.getMedian()
    }
}
