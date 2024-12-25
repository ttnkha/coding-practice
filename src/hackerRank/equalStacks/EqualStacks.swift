/// Finds the maximum equal height possible for three stacks of blocks
/// - Parameters:
///   - stack1: First stack of block heights
///   - stack2: Second stack of block heights
///   - stack3: Third stack of block heights
/// - Returns: Maximum possible equal height for all stacks
func equalStacks(stack1: [Int], stack2: [Int], stack3: [Int]) -> Int {
    // Initialize stacks and their current heights
    var stacks = [stack1, stack2, stack3]
    var stackHeights = Array(repeating: 0, count: stacks.count)
    var maxEqualHeight = 0
    
    // Return 0 if any stack is empty
    if stacks.contains(where: { $0.isEmpty }) {
        return 0
    }
    
    // Continue while there are blocks in all stacks
    while stacks.contains(where: { !$0.isEmpty }) {
        let tallestStack = stackHeights.max()!
        
        // Find shorter stack and add blocks until it matches or exceeds tallest stack
        if let shorterStackIndex = stackHeights.firstIndex(where: { $0 < tallestStack }) {
            if stacks[shorterStackIndex].isEmpty {
                break
            }
            
            while stackHeights[shorterStackIndex] < tallestStack, 
                  !stacks[shorterStackIndex].isEmpty {
                stackHeights[shorterStackIndex] += stacks[shorterStackIndex].popLast()!
            }
        }
        
        // If all stacks are equal height, record it and remove one block from each
        if stackHeights.allSatisfy({ $0 == tallestStack }) {
            maxEqualHeight = tallestStack
            
            // Remove top block from each stack and update heights
            stackHeights = stackHeights.enumerated().map { index, height in 
                height + (stacks[index].popLast() ?? 0)
            }
        }
    }
    
    // Check if final state has equal heights
    if stackHeights.allSatisfy({ $0 == stackHeights.max()! }) {
        maxEqualHeight = stackHeights.max()!
    }
    
    return maxEqualHeight
}