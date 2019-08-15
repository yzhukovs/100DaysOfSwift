import UIKit

func binaryReverse(n: Int)->Int? {
 let newBinary = String(n, radix: 2)
  //  guard let nonOptionalBinary = newBinary else {return nil}
    return Int(newBinary)
    
}
print(binaryReverse(n: 4))
