func separateNumbers(s: String) -> Void {
    guard !s.isEmpty, s.first != "0" else { 
        print("NO") 
        return 
    }
    
    for len in 1...s.count/2 {
        let first = String(s.prefix(len))
        var num = Int(first)!
        var test = first
        
        while test.count < s.count {
            num += 1
            test += String(num)
        }
        
        if test == s {
            print("YES", first)
            return
        }
    }
    
    print("NO")
}
