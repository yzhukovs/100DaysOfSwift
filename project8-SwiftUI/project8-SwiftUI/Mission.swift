//
//  Mission.swift
//  project8-SwiftUI
//
//  Created by Yvette Zhukovsky on 11/6/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import Foundation



struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
    
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
}
