import UIKit

let value = 100
let givenRange = 10 ... 300
print(givenRange ~= value) // prints true


let word = "mouse"
let sentence = "The mouse ran over the bridge"
 var separated = sentence.components(separatedBy: " ")
for i in separated {
    if i ~= word {
        print("hello")
    }
}
//print(sentence ~= word)
