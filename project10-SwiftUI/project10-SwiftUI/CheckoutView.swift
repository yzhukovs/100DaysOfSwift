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
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var titleText = ""
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
                        self.placeOrder()
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitle("Check Out", displayMode: .inline)
        .alert(isPresented: $showingConfirmation) {
            Alert(title: Text(titleText), message: Text(confirmationMessage), dismissButton: .default(Text("OK!")))
        }
    }
    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("failed to encode order")
            return
        }
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
               self.confirmationMessage = "There is no internet connection, please try again"
                self.showingConfirmation = true
                self.titleText = "❌No Connection❌"
                return
            }
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationMessage = "Your order for \(decodedOrder.quantity) x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on it's way"
                self.titleText = "Thank you!"
                self.showingConfirmation = true
            } else {
                print("Invalid response from the server")
            }
            
        }.resume()
        
    }
    
}
struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
