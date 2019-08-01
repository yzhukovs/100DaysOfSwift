//
//  Person.swift
//  project10
//
//  Created by Yvette Zhukovsky on 7/12/19.
//  Copyright © 2019 Lambda School Labs. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
}
