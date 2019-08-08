import UIKit

func myPow(num: Int, power: Int) -> Int{
    var number = 1
    for _ in 0..<power {
        number =   number * num
    }
    return number

}
print(myPow(num: 4, power: 3))
print(myPow(num: 4, power: 0))
