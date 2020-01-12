//
//  Prospect.swift
//  project16-SwiftUI
//
//  Created by Yvette Zhukovsky on 1/11/20.
//  Copyright © 2020 bumnetworks. All rights reserved.
//

import Foundation

class Prospect: Identifiable, Codable {
    
    let id = UUID()
    var name = "annonymous"
    var emailAddress = ""
    var isContacted = false
}

class Prospects: ObservableObject {
    @Published var people: [Prospect]
    init() {
        self.people = []
    }
}
