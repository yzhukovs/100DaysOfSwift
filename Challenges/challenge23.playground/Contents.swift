import UIKit

func StringToNum(a: String)-> Bool {

    let numbers: CharacterSet = CharacterSet.decimalDigits
    if a.rangeOfCharacter(from: numbers.inverted) == nil {
        return true
    }
    return false
}

StringToNum(a: "1.01")
