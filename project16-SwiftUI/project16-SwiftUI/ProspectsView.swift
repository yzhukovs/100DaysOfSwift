//
//  ProspectsView.swift
//  project16-SwiftUI
//
//  Created by Yvette Zhukovsky on 1/6/20.
//  Copyright © 2020 bumnetworks. All rights reserved.
//

import SwiftUI

struct ProspectsView: View {
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
    var body: some View {
        NavigationView {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationBarTitle(title)
    }
}
}
struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
