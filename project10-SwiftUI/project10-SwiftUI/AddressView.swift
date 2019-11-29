//
//  AddressView.swift
//  project10-SwiftUI
//
//  Created by Yvette Zhukovsky on 11/25/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var container: Container
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $container.order.name)
                TextField("Street Address", text: $container.order.streetAddress)
                TextField("City", text: $container.order.city)
                TextField("Zip", text: $container.order.zip)
            }
            
            Section {
                NavigationLink(destination: CheckoutView(container: container)) {
                    Text("Check out")
                }
            }
            .disabled(container.order.hasValidAddress == false)
        }
        .navigationBarTitle("Delivery details", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(container: Container())
    }
}
