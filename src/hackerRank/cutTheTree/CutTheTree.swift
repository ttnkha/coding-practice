class DFS {
    private var graph: [[Int]]
    private var data: [Int]
    private var subtreeSums: [Int]
    
    // Initialize with data and edges
    init(data: [Int], edges: [[Int]]) {
        self.data = data
        self.subtreeSums = Array(repeating: 0, count: data.count)
        self.graph = Array(repeating: [], count: data.count)
        buildGraph(from: edges)
    }
    
    // Build adjacency list from edges
    private func buildGraph(from edges: [[Int]]) {
        for edge in edges {
            let node1 = edge[0] - 1
            let node2 = edge[1] - 1
            graph[node1].append(node2)
            graph[node2].append(node1)
        }
    }
    
    // Calculate the sum of all nodes in the subtree rooted at `node`
    func calculateSubtreeSum(from node: Int, parent: Int) -> Int {
        var sum = data[node]
        
        for neighbor in graph[node] where neighbor != parent {
            sum += calculateSubtreeSum(from: neighbor, parent: node)
        }
        
        subtreeSums[node] = sum
        return sum
    }
    
    // Get the pre-calculated subtree sum for a node
    func getSubtreeSum(for node: Int) -> Int {
        return subtreeSums[node]
    }
}

// Main function to solve the problem
func cutTheTree(data: [Int], edges: [[Int]]) -> Int {
    let totalSum = data.reduce(0, +)  // Total sum of all nodes
    let dfs = DFS(data: data, edges: edges)  // Create DFS object
    let rootNode = edges[0][0] - 1  // Get starting node (adjusted to zero-indexed)
    
    // Calculate subtree sums starting from the root
    _ = dfs.calculateSubtreeSum(from: rootNode, parent: -1)
    
    // Find the minimum difference when cutting edges
    var minDiff = Int.max
    
    for edge in edges {
        let node1 = edge[0] - 1
        let node2 = edge[1] - 1
        
        // Subtree sums for both nodes after cutting the edge
        let subtree1 = dfs.getSubtreeSum(for: node1)
        let subtree2 = dfs.getSubtreeSum(for: node2)
        
        // Calculate the possible sum splits
        let smallerSum = min(subtree1, subtree2)
        let largerSum = totalSum - smallerSum
        
        // Track the minimum absolute difference between the two partitions
        minDiff = min(minDiff, abs(smallerSum - largerSum))
    }
    
    return minDiff
}
