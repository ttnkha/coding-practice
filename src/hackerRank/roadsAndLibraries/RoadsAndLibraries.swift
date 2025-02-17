class UnionFind {
    private var root: [Int]
    private var components: Int
    
    init(_ n: Int, _ cities: [[Int]]) {
        root = Array(0..<n)
        components = n
        for road in cities {
            insert(road[0] - 1, road[1] - 1)
        }
    }
    
    private func insert(_ x: Int, _ y: Int) {
        var rootX = findRoot(x)
        var rootY = findRoot(y)
        
        if rootX == rootY { return }
        
        if rootX > rootY {
            swap(&rootX, &rootY)
        }
        
        root[rootY] = rootX
        components -= 1
    }
    
    func findRoot(_ x: Int) -> Int {
        if root[x] == x { return x }
        root[x] = findRoot(root[x])
        return root[x]
    }
    
    func getComponent() -> Int {
        return components
    }
}

func roadsAndLibraries(n: Int, c_lib: Int, c_road: Int, cities: [[Int]]) -> Int {
    if c_lib <= c_road || cities.isEmpty {
        return c_lib * n
    }
    
    let uf = UnionFind(n, cities)
    let components = uf.getComponent()
    return components * c_lib + (n - components) * c_road
}