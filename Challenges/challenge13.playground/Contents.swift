import UIKit

func runLenght(a: String)-> String {
    var output = ""
    var count = 0
    var current: Character
    var letterArray = Array(a)
    
    
    for i in 0 ..< letterArray.count {
        count += 1
    
        if i + 1 == letterArray.count || letterArray[i] != letterArray[i + 1] {
            print(letterArray[i])
           output += "\(letterArray[i])\(count)"
            count = 0
        }
        
    }
    return output
}
runLenght(a: "aabbcc")
