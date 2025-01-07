// Function to construct the graph from the edge list
func constructGraph(n: Int, edges: [[Int]]) -> [[Int]] {
    var graph: [[Int]] = Array(repeating: [], count: n)
    
    // Populate graph with edges
    for edge in edges {
        let node1 = edge[0] - 1
        let node2 = edge[1] - 1
        graph[node1].append(node2)
        graph[node2].append(node1)
    }

    return graph
}

// Function to perform BFS and calculate the shortest path distances from the start node
func bfs(n: Int, m: Int, edges: [[Int]], s: Int) -> [Int] {
    let graph = constructGraph(n: n, edges: edges)
    let startIndex = s - 1
    var distances = Array(repeating: -1, count: n) // Initialize all distances as -1
    distances[startIndex] = 0 // Distance to start node is 0
    
    var queue = [startIndex]
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        
        // Traverse through all neighbors of the current node
        for neighbor in graph[node] {
            if distances[neighbor] == -1 { // If the neighbor hasn't been visited
                distances[neighbor] = distances[node] + 6 // Increment distance by 6
                queue.append(neighbor)
            }
        }
    }
    
    // Remove the start node distance from the result (because it's not needed)
    distances.remove(at: startIndex)
    return distances
}
