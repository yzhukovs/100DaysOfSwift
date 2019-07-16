import UIKit

func preFix(a: String)-> String {
    var seperatedArray = a.components(separatedBy: " ")
    guard let first = seperatedArray.first else {return ""}
    print(first)
    var checkingPrefixes = ""
    var bestPrefix: String = ""
    for i_a in first {
        checkingPrefixes.append(i_a)
        
        
        for i_b in seperatedArray {
            if !i_b.hasPrefix(checkingPrefixes) {
                return bestPrefix
            }
        }
        bestPrefix = checkingPrefixes
    }
    return bestPrefix
    } 




print(preFix(a: "flip flap flop"))

//for j in i {
//    if i.hasPrefix(String(j))   {
//
//    }
//}
