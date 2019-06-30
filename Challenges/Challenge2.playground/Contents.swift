import UIKit

func palindrome(word: String)-> Bool {
    let tempWord = word.lowercased().reversed()
    var wordArray = [Character]()
    var reversedArray = [Character]()
    for i in word.lowercased() {
        wordArray.append(i)
}
    for i in tempWord {
        reversedArray.append(i)
    }
    if wordArray == reversedArray {
        return true
    } else {
        return false
    }
    
}

palindrome(word: "Rats live on no evil star")
