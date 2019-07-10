import UIKit

func vowelsAndConsonants(a: String)-> (vowels: Int, consonants: Int) {
    let vowel = ["A", "E", "I", "O", "U"]
    let consonant  = ["B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "V", "W", "X", "Y", "Z"]
    var countV=[Character]()
    var countC=[Character]()
    
    for i in a.uppercased() {
        if vowel.contains(String(i)) {
           countV.append(i)
        } else {
            if consonant.contains(String(i)) {
                countC.append(i)
            }
            
        }
    }
   let vowels = countV.count
   let consonants = countC.count
        return (vowels, consonants)
}

vowelsAndConsonants(a: "Swift Coding Challenges")
