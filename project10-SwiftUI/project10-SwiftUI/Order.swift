//
//  Order.swift
//  project10-SwiftUI
//
//  Created by Yvette Zhukovsky on 11/25/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import Foundation

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    
    
}
