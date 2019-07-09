//
//  Petition.swift
//  project7
//
//  Created by Yvette Zhukovsky on 6/14/19.
//  Copyright © 2019 Lambda School Labs. All rights reserved.
//

import Foundation
struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
    
}

struct Petitions: Codable {
    var results: [Petition]
    
}
