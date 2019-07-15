import UIKit

func different3Letters(a: String, b: String) ->Bool {
    let stringA = Array(a)
    var stringB = Array(b)
    var count = 0
    if stringA.count != stringB.count { return false}
    for (i_a, j_a) in stringA.enumerated() {
        if stringB[i_a] != j_a {
                count += 1
           
            if count > 3{
                return false
                }
        }
        }
    
    return true
}

different3Letters(a: "Clamp", b: "Cramp")
