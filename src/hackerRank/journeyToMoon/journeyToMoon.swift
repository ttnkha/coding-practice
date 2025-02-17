class UnionFind {
    var parent: [Int]
    var size: [Int]
    
    init(_ n: Int, _ astronaut: [[Int]]) {
        parent = Array(0..<n)
        size = Array(repeating: 1, count: n)
        for astro in astronaut {
            insert(astro[0], astro[1])
        }
    }
    
    private func findRoot(_ x: Int) -> Int {
        if parent[x] == x { return x }
        parent[x] = findRoot(parent[x])
        return parent[x]
    }
    
    private func insert(_ x: Int, _ y: Int) {
        var rootX = findRoot(x)
        var rootY = findRoot(y)
        
        if rootX == rootY { return }
        
        if size[rootX] > size[rootY] {
            swap(&rootX, &rootY)
        }
        
        size[rootX] += size[rootY]
        parent[rootY] = rootX
    }
    
    func getComponentSizes() -> [Int] {
        var componentSizes = [Int]()
        for i in 0..<parent.count {
            if parent[i] == i {
                componentSizes.append(size[i])
            }
        }
        return componentSizes
    }
}

func journeyToMoon(n: Int, astronaut: [[Int]]) -> Int {
    let uf = UnionFind(n, astronaut)
    let countrySizes = uf.getComponentSizes()
    
    let totalAstronauts = n
    let totalPossiblePairs = totalAstronauts * (totalAstronauts - 1) / 2
    
    var sameCountryPairs = 0
    for size in countrySizes {
        sameCountryPairs += size * (size - 1) / 2
    }
    
    return totalPossiblePairs - sameCountryPairs
}