import UIKit

func CountingChar(_ a: String, _ b: Character)-> Int {
    var counting = 0
    for i in a {
        if i == b {
        counting += 1
        }
    }
   return counting
    
}

CountingChar("Mississippi", "i")
