import UIKit

func Spaced(a: String)-> String {
   
    //create an array to store output
    var spaces = [Character]()
    //iterate through string
    for (i, j) in Array(a).enumerated() {
    
        //see if current and next item is space
        if !(j == " " && Array(a)[i + 1] == " "){
            spaces.append(j)
        }
    }
    return String(spaces)
}

print(Spaced(a: "    a  b    c"))
