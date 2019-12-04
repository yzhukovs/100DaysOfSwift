//
//  FilteredList.swift
//  project12-SwiftUI-CoreData
//
//  Created by Yvette Zhukovsky on 12/2/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import CoreData
import SwiftUI

enum Predicate: String {
    case beginsWith = "BEGINSWITH[c] %@"
    case contains = "CONTAINS[c] %@"
    case equals = "== %@"
}


struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> {
        fetchRequest.wrappedValue
    }
    let content:(T)->Content
    
    var body: some View {
        List(singers, id: \.self) { singer in
            self.content(singer)
            
        }
    }
    
    init(filterKey: String, predicate: Predicate.RawValue, filterValue: String, sortKey: KeyPath<Singer, String?> , @ViewBuilder content: @escaping (T)-> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [NSSortDescriptor(keyPath: sortKey, ascending: true)], predicate: NSPredicate(format: "\(filterKey) \(Predicate.beginsWith.rawValue)" , "\(filterValue)"))
        self.content = content
    }
    
}

