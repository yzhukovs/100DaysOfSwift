import UIKit

func different3Letters(a: String, b: String) ->Bool {
    var stringA = [Character]()
    var stringB = [Character]()
    stringA = Array(a)
    stringB = Array(b)
    var count = 0
    if stringA.count != stringB.count { return false}
    for (i_a, j_a) in stringA.enumerated() {
        for (i_b, j_b) in stringB.enumerated() {
            if i_a != i_b {
                return false
            }
            
            if j_a != j_b {
                count += 1
            }
            if count > 3 {
                return false
            } else {
                return true
                }
            
        }
    }
    return false
}

different3Letters(a: "Grans", b: "Cramp")
