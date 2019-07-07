import UIKit

func Spaced(a: String)-> String {
    var arrayChar = [Character]()
    //create an array to store output
    var spaces = [Character]()
    //iterate through string
    for (i, j) in Array(a).enumerated() {
        //see if current and next item is space
        if j == " " && Array(a)[i + 1] == " "{
            
        }
    }
    return String(spaces)
}

Spaced(a: "a  b    c")
