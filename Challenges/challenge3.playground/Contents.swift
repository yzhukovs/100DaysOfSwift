import UIKit

func comparingStrings(_ a: String,_ b: String)-> Bool {
    var stringA = [Character]()
    var stringB = [Character]()
    
    for i_a in a {
        stringA.append(i_a)
    }
    stringA.sort()
    
    for i_b in b {
        stringB.append(i_b)
    }
    
    stringB.sort()
    
    return stringA.elementsEqual(stringB)
    
}

func comparingStringsB(_ a: String,_ b: String)-> Bool {
    return a.sorted() == b.sorted()
}

comparingStrings("abcc", "abc")
comparingStringsB("bac", "abc")
