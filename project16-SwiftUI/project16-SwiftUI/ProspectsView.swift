//
//  ProspectsView.swift
//  project16-SwiftUI
//
//  Created by Yvette Zhukovsky on 1/6/20.
//  Copyright © 2020 bumnetworks. All rights reserved.
//

import SwiftUI

struct ProspectsView: View {
    @EnvironmentObject var prospects: Prospects
    let filter: FilterType
    enum FilterType {
        case none, contacted, uncontacted
    }
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted People"
        case .uncontacted:
            return "Uncontacted People"
        }
    }
    
    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter {$0.isContacted}
        case .uncontacted:
            return prospects.people.filter {!$0.isContacted}
        }
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredProspects) { prospect in
                    VStack(alignment: .leading) {
                        Text(prospect.name)
                            .font(.headline)
                        Text(prospect.emailAddress)
                            .foregroundColor(.secondary)
                    }
                    
                }
            }
            .navigationBarTitle(title)
                .navigationBarItems(trailing: Button(action: {
                 let prospect = Prospect()
                    prospect.name = "Paul Hudson"
                    prospect.emailAddress = "paul@hackingwithswift.com"
                    self.prospects.people.append(prospect)
                }){
                    Image(systemName: "qrcode.viewfinder")
                    Text("Scan")
                    
                    })
    }
}
}
struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
