func getMaximumScore(integerArray: [Int]) -> Int {
    var remaining = integerArray
    var isOddOperation = true
    var totalScore = 0
    
    while !remaining.isEmpty {
        var sum = remaining.reduce(0, +)
        if !isOddOperation {sum = -1*sum}
        totalScore = totalScore + sum
        
        if remaining.count == 1 {
            break
        }
        
        if isOddOperation {
            // next one is even - substraction - remove greatest element of first/last
            if remaining.first! > remaining.last! {
                print("remove first")
                remaining.removeFirst()
            } else {
                print("remove last")
                remaining.removeLast()
            }
        } else {
            // next one is odd - addition - remove least element of first/last
            if remaining.first! < remaining.last! {
                remaining.removeFirst()
                print("remove first")
            } else {
                print("remove last")
                remaining.removeLast()
            }
        }
        print("remaining = \(remaining), sum = \(sum), totalScore = \(totalScore)")
        isOddOperation = !isOddOperation
    }
    
    return totalScore
}
//getMaximumScore(integerArray: [3,6,8])
//getMaximumScore(integerArray: [1,2,3])
getMaximumScore(integerArray: [1,10])
