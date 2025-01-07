class UnionFind {
    // `parent` stores the parent of each node. Initially, each node is its own parent.
    private var parent: [Int]
    
    // `size` stores the size of the component for each root node. Initially, each component size is 1.
    private var size: [Int]
    
    // Initialize the UnionFind data structure with `n` nodes.
    // Each node is initially its own parent, and the size of each component is 1.
    init(_ n: Int) {
        parent = Array(0..<n)  // Parent of each node is itself initially.
        size = Array(repeating: 1, count: n)  // Every component starts with size 1.
    }
    
    // Find the root of the component containing `x` with path compression.
    // This reduces the tree depth for future queries.
    func findRoot(_ x: Int) -> Int {
        if parent[x] == x { return x }  // If `x` is its own parent, it is the root.
        parent[x] = findRoot(parent[x])  // Path compression: make the parent of `x` the root of its component.
        return parent[x]
    }
    
    // Union the components containing `x` and `y`.
    // The smaller tree is attached to the root of the larger tree to keep the tree balanced.
    func union(_ x: Int, _ y: Int) {
        var rootX = findRoot(x)  // Find the root of `x`.
        var rootY = findRoot(y)  // Find the root of `y`.
        
        // If `x` and `y` are already in the same component, no need to union.
        if rootX == rootY { return }
        
        // Union by size: attach the smaller tree under the larger tree to maintain balance.
        if size[rootX] < size[rootY] {
            swap(&rootX, &rootY)  // Swap `rootX` and `rootY` to ensure `rootX` is the larger tree.
        }
        
        size[rootX] += size[rootY]  // Update the size of the new root component.
        parent[rootY] = rootX  // Attach the root of `y`'s component to `x`'s root.
    }

    // Get the sizes of all components.
    // This method returns the sizes of the components where the node is the root.
    func getComponentSizes() -> [Int] {
        var componentSizes = [Int]()
        let n = parent.count  // Get the number of nodes
        
        // Loop through all nodes to find the roots and their component sizes.
        for i in 0..<n {
            if parent[i] == i && size[i] > 1 {  // If `i` is a root and the component size is greater than 1.
                componentSizes.append(size[i])  // Add the size of the component.
            }
        }

        return componentSizes  // Return all component sizes.
    }
}

// Function to calculate the sizes of connected components in the graph.
func componentsInGraph(gb: [[Int]]) -> [Int] {
    // Edge case: If the graph is empty, there are no components.
    guard !gb.isEmpty else { return [0, 0] }

    // Find the maximum node number to determine the number of nodes in the graph.
    // We use this to initialize the UnionFind structure.
    let node = gb.flatMap { $0 }.max()!  // Flatten the edge list and find the largest node number.
    let uf = UnionFind(node)  // Initialize UnionFind with the total number of nodes.
    
    // For each edge, union the two nodes in the edge.
    for edge in gb {
        uf.union(edge[0] - 1, edge[1] - 1)  // Subtract 1 to convert from 1-based to 0-based indexing.
    }
    
    // Get the sizes of all connected components.
    let componentSizes = uf.getComponentSizes()

    // Edge case: If there are no components, return [0, 0].
    guard !componentSizes.isEmpty else { return [0, 0] }
    
    // Return the smallest and largest component sizes.
    return [componentSizes.min()!, componentSizes.max()!]
}
