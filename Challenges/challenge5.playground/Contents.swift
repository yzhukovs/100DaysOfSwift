import UIKit

func CountingChar(_ a: String, _ b: Character)-> Int {
    var arrayChars = [Character]()
    for i in a {
        if i == b {
          arrayChars.append(i)
        }
    }
   return arrayChars.count
    
}

CountingChar("Mississippi", "i")
