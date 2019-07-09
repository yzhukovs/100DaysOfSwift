import UIKit

//func revStrings(a: String, b: String)-> Bool {
//    for i_a in Array(a).reversed() {
//        for i_b in Array(b){
//            print("\(i_a) , \(i_b)")
//            if i_a.lowercased() != i_b.lowercased() {
//                return false
//
//            }
//        }
//    }
//
//
//  return true
//}


func revStrings(input: String, rotated: String) -> Bool {
    guard input.count == rotated.count else { return false }
    let combined = input + input
    return combined.contains(rotated)
}

revStrings(input: "abcde", rotated: "eabcd")
