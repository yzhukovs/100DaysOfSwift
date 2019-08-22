import UIKit


  
    func repeatingNumbers(a:[Int])->Int  {
            var counter = [Int: Int]()
            for i in a {
                counter[i] = (counter[i] ?? 0) + 1
                }
            var tuplesArray = counter.sorted(by: {$0.1 > $1.1})
            return tuplesArray[0].key
    }  
        

    
//    var tuplesArray = [(Int, Int)]()
//    tuplesArray = Array(counter)
//    var output = tuplesArray.map {$0.1}.max()
//    print(output)
//    return tuplesArray


print(repeatingNumbers(a: [1,2,1,5,1,4]))
//[5: 1, 2: 1, 1: 3, 4: 1]

