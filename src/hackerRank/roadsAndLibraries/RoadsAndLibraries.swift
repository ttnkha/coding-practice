class UnionFind {
    private var parent: [Int]
    private var components: Int
    
    init(_ n: Int) {
        parent = Array(repeating: -1, count: n)
        components = n
    }
    
    func find(_ x: Int) -> Int {
        if parent[x] < 0 { return x }
        parent[x] = find(parent[x])
        return parent[x]
    }
    
    func union(_ x: Int, _ y: Int) -> Bool {
        var rootX = find(x)
        var rootY = find(y)
        
        if rootX == rootY { return false }
        
        if parent[rootX] > parent[rootY] {
            swap(&rootX, &rootY)
        }
        
        parent[rootX] += parent[rootY]
        parent[rootY] = rootX
        components -= 1
        return true
    }
    
    func getComponent() -> Int {
        return components
    }
}

func roadsAndLibraries(n: Int, c_lib: Int, c_road: Int, cities: [[Int]]) -> Int {
    if c_road >= c_lib || cities.isEmpty {
        return n * c_lib
    }
    
    let uf = UnionFind(n)
    for city in cities {
        uf.union(city[0] - 1, city[1] - 1)
    }
    let componentCount = uf.getComponent()

    return componentCount * c_lib + (n - componentCount) * c_road
}