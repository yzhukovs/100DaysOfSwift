import UIKit

func removeDups(a: String)-> String {
    var found = Set<Character>()
    var output = ""
    for i in a {
        if !found.contains(i) {
            found.insert(i)
            output += String(i)
        }
    }
    return output
}

func removeDups2(a: String) -> String {
    // 1. set up some way to keep track of unique chars
    var found = Set<Character>()
    var output = ""
    // 2. iterate over characters of input
    for i in a {
        //    2a. if character was seen - do nothing
        if found.contains(i) {
            continue
        }
        
        //    2b. if character was not seen:
        if !found.contains(i) {
            //        2b(1). make sure it doesn't get seen again
            found.insert(i)
            //        2b(2). append it to output
            output += String(i)
        }
    }
    return output
}


removeDups(a: "Mississipi")
