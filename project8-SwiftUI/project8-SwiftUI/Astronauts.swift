//
//  Astronauts.swift
//  project8-SwiftUI
//
//  Created by Yvette Zhukovsky on 11/6/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import Foundation

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    
   
    
    func wasInMissions(missions: [Mission]) -> [Mission] {
        return missions.filter { $0.hasAstronaut(a: self)
            
        }
    }
        
    
       
}

