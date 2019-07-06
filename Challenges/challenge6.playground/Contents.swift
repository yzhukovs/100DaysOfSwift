import UIKit

func removeDups(a: String)-> String {
    var found = Set<Character>()
    found = Set(a)
    var charArrays = [Character]()
    for i in found {
        if found.contains(i) {
            charArrays.append(i)
    }
    }
    return String(charArrays)
}

removeDups(a: "Mississipi")
