//
//  ContentView.swift
//  project12-SwiftUI-CoreData
//
//  Created by Yvette Zhukovsky on 12/2/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    
    var body: some View {
        VStack {
            FilteredList(filterKey: "lastname", predicate: Predicate.beginsWith.rawValue, filterValue: lastNameFilter, sortKey: \Singer.lastname)  { (singer:Singer) in
                            Text("\(singer.wrappedFirstName), \(singer.wrappedLastName)")
                            
                        }
            //            FilteredList(sortKey: \Singer.lastname,  filterKey: "lastname", predicate: <#Predicate.RawValue#>, filterValue: lastNameFilter) { (singer:Singer) in
//                Text("\(singer.wrappedFirstName), \(singer.wrappedLastName)")
                
            
          // List of singers
        
        Button("Add Examples") {
            let taylor = Singer(context: self.moc)
            taylor.firstname = "Taylor"
            taylor.lastname = "Swift"
            
            let ed = Singer(context: self.moc)
            ed.firstname = "Ed"
            ed.lastname = "Sheeran"
            
            let adele = Singer(context: self.moc)
            adele.firstname = "Adele"
            adele.lastname = "Adkins"
            
            let axl = Singer(context: self.moc)
            axl.firstname = "Axl"
            axl.lastname = "Rose"
            
            try? self.moc.save()
        }
            Button("Show A") {
                self.lastNameFilter = "A"
            }
            Button("Show S") {
                self.lastNameFilter = "S"
            }
            Button("Show R") {
                self.lastNameFilter = "R"
                       }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
