import UIKit

//func binaryReverse(n: Int)->Int? {
// let newBinary = String(n, radix: 2)
//  //  guard let nonOptionalBinary = newBinary else {return nil}
//    return Int(newBinary)
//
//}
//print(binaryReverse(n: 4))



func repeatingNumbers(a:[Int]) {
    var counter = [Int: Int]()
    for i in a {
        counter[i] = (counter[i] ?? 0) + 1
    }
    var tuplesArray = [(Int, Int)]()
    tuplesArray = Array(counter)
    
    print(tuplesArray)
    
}

repeatingNumbers(a: [1,2,1,5,1,4])
