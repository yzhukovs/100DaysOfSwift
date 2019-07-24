import UIKit



func reversedWords(a: String)-> String {
    let words = a.components(separatedBy: " ")
   var charArray = [Character]()
   let joinedd = words.reversed()
    let output = joinedd.joined(separator: " ")
    charArray = Array(output)
    return String(charArray.map {$0}.reversed())
}

print(reversedWords(a: "Swift Coding Challenges"))
print(reversedWords(a: "The quick brown fox"))
