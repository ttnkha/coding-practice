func getCost(gNodes: Int, gFrom: [Int], gTo: [Int], gWeight: [Int]) {
    // Build the edge list with weights
    var edges = [(from: Int, to: Int, weight: Int)]()
    for i in 0..<gFrom.count {
        edges.append((gFrom[i] - 1, gTo[i] - 1, gWeight[i]))
    }
    
    // Sort edges by weight (ascending)
    edges.sort { $0.weight < $1.weight }
    
    // Union-Find (Disjoint Set Union) setup
    var parent = Array(0..<gNodes)
    var rank = Array(repeating: 0, count: gNodes)
    
    func find(_ node: Int) -> Int {
        if parent[node] != node {
            parent[node] = find(parent[node]) // Path compression
        }
        return parent[node]
    }
    
    func union(_ node1: Int, _ node2: Int) -> Bool {
        let root1 = find(node1)
        let root2 = find(node2)
        
        if root1 == root2 { return false } // Already connected
        
        // Union by rank
        if rank[root1] > rank[root2] {
            parent[root2] = root1
        } else if rank[root1] < rank[root2] {
            parent[root1] = root2
        } else {
            parent[root2] = root1
            rank[root1] += 1
        }
        return true
    }
    
    // Kruskal-like process: Find the minimum maximum edge
    for edge in edges {
        let (from, to, weight) = edge
        union(from, to)
        
        // Check if source (0) and destination (gNodes - 1) are connected
        if find(0) == find(gNodes - 1) {
            print(weight)
            return
        }
    }
    
    // If no path exists
    print("NO PATH EXISTS")
}