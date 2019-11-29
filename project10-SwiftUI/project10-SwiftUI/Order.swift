//
//  Order.swift
//  project10-SwiftUI
//
//  Created by Yvette Zhukovsky on 11/25/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import Foundation
class Container: ObservableObject {
    //    internal init(_order: Published<Order>) {
    //        self._order = _order
    //    }
    
    @Published var order: Order = Order()
    
}



struct Order:  Codable {
    
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
    var types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    
    var hasValidAddress: Bool {
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            || streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }
        return true
    }
    
    
    var cost: Double {
        var cost = Double(quantity) * 2
        cost += Double(type) / 2
        
        if extraFrosting {
            cost += Double(quantity)
        }
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        return cost
    }
    
    init() { }
    //    func encode(to encoder: Encoder) throws {
    //        var container = encoder.container(keyedBy: CodingKeys.self)
    //        try container.encode(type, forKey: .type)
    //        try container.encode(quantity, forKey: .quantity)
    //        try container.encode(extraFrosting, forKey: .extraFrosting)
    //        try container.encode(addSprinkles, forKey: .addSprinkles)
    //        try container.encode(name, forKey: .name)
    //        try container.encode(streetAddress, forKey: .streetAddress)
    //        try container.encode(city, forKey: .city)
    //        try container.encode(zip, forKey: .zip)
    //
    //    }
    
    //    required init(from decoder: Decoder) throws {
    //        let container = try decoder.container(keyedBy: CodingKeys.self)
    //        type = try container.decode(Int.self, forKey: .type)
    //        quantity = try container.decode(Int.self, forKey: .quantity)
    //        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
    //        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
    //        name = try container.decode(String.self, forKey: .name)
    //        streetAddress = try container.decode(String.self, forKey: .streetAddress)
    //        city = try container.decode(String.self, forKey: .city)
    //        zip = try container.decode(String.self, forKey: .zip)
    //    }
    
}
