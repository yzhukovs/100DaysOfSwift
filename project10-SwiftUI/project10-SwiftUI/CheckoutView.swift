//
//  CheckoutView.swift
//  project10-SwiftUI
//
//  Created by Yvette Zhukovsky on 11/25/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image("cupcakes")
                    .resizable()
                    .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    Text("Your total is: $\(self.order.cost, specifier: "%2.f")")
                        .font(.title)
                    Button("Place order") {
                        //Place the order
                    }
                .padding()
                }
            }
        }
        .navigationBarTitle("Check Out", displayMode: .inline)
}
}
struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
