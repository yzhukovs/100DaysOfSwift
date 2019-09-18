import UIKit




func someOfInt(a: String)-> Int {
    var result = 0
    for i in a {
        if Int(String(i)) != nil {
            result += Int(String(i)) ?? 0
        }
       
    }
    
    return result
}

print(someOfInt(a: "a10b20c30"))

func challenge26c(subtract: Int, from: Int) -> Int {
    print(~subtract)
   return from + (~subtract + 1 )
    
}
challenge26c(subtract: 10, from: 20)
