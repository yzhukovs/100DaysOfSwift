import UIKit

func pangrams(a: String) -> Bool{
    var pang = Set<Character>()
    pang = Set(a.lowercased().trimmingCharacters(in: .whitespacesAndNewlines).filter{$0 != " "})
    let alphabet:[Character] = ["a", "b","c","d","e","f", "g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    
    for (i_a, j_a) in alphabet.enumerated() {
        for (i_b, j_b) in pang.enumerated() {
            if j_a == j_b {
                pang.remove(j_b)
                print(pang)
            }
        }
    }
    if pang.isEmpty {
        return true }
    return false
}


pangrams(a: "Thequick brown fox jumps over the lazy dog")

