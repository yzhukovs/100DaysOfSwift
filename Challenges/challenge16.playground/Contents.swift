import UIKit

func fizzBuzz(a: Int)-> String {
    
    switch (a % 3 == 0, a % 5 == 0 ) {
    case (true, true):
        return "Fizz Buzz"
      case (true, false):
        return "Fizz"
    case (false, true):
        return "Buzz"
    default:
        return String(a)
    }
    
    
}

fizzBuzz(a: 3)
fizzBuzz(a: 5)
fizzBuzz(a: 15)
fizzBuzz(a: 1)

