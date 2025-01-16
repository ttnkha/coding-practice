func pylons(k: Int, arr: [Int]) -> Int {
    var plants = 0
    var i = 0
    let n = arr.count
    
    while i < n {
        let hasElectric = arr[i] == 1 && i > 0
        let reachStart = min(i + (hasElectric ? 1 : 0), n - 1)
        let reachEnd = min(i + k - 1 + (hasElectric ? k : 0), n - 1)
        
        guard let farthestHouse = arr[reachStart...reachEnd].lastIndex(of: 1) else {
            return hasElectric && reachEnd < i + k ? plants : -1
        }
        
        if farthestHouse == i && farthestHouse == n - 1 {
            return plants
        }
        
        i = farthestHouse + (farthestHouse == i ? 1 : 0)
        plants += 1
    }
    return plants
}