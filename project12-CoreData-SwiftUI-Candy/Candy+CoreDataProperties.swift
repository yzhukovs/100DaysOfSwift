//
//  Candy+CoreDataProperties.swift
//  project12-CoreData-SwiftUI-Candy
//
//  Created by Yvette Zhukovsky on 12/3/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?
    
    public var wrappedName: String {
        name ?? "Unknown name"
    }

}
