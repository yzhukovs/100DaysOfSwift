import UIKit


func rob(_ numbers: [Int]) -> Int {
    //let numbers = nums.sorted()
    var difference  = [Int]()
    // var diff = 0
    for index in stride(from: 1, to: numbers.count, by: 2) {
        print(index)
        if 1 != (numbers[index] - numbers[index - 1]) {
            difference.append(numbers[index - 1])
        }
    }
    print(difference)
    return 1
}


print(rob([2,7,9,3,1]))


