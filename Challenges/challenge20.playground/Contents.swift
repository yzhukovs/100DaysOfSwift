import UIKit

func primeNumber(a: Int)-> Bool {
    
    for i in 2...(a/2) {
        if a % i == 0 {
            return false
        }
       
    }
    return true
}
primeNumber(a: 16777259)
