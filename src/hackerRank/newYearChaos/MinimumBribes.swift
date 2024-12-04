func minimumBribes(q: [Int]) -> Void {
    let n = q.count  // Get the total number of people in the queue.
    
    var bribes = 0  // Initialize a counter to track the total number of bribes.
    var last = q[n - 1]  // Track the last processed person in the queue.
    
    // Iterate through the queue in reverse order, starting from the second-to-last person.
    for i in (0...(n-2)).reversed() {
        
        // If a person is more than two positions ahead of their original position, the queue is too chaotic.
        if q[i] - (i + 1) > 2 {
            print("Too chaotic")
            return
        }
        
        // If a person has moved exactly 2 places forward, they must have bribed twice.
        if q[i] == i + 3 {
            bribes += 2
        } 
        // If the current person is ahead of the previous person, they must have bribed once.
        else if q[i] > last {
            bribes += 1
        } else {
            // Update last if the current person is in the correct order or has moved fewer than two places ahead.
            last = q[i]
        }
    }
    
    // Print the total number of bribes.
    print(bribes)
}
