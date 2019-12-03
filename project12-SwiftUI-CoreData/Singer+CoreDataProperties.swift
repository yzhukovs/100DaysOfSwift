//
//  Singer+CoreDataProperties.swift
//  project12-SwiftUI-CoreData
//
//  Created by Yvette Zhukovsky on 12/2/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?

    
    var wrappedFirstName: String {
        firstname ?? "Unknown"
    }
    
    var wrappedLastName: String {
        lastname ?? "Unknown"
    }
}
