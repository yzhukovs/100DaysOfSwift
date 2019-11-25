//
//  ContentView.swift
//  project10-SwiftUI
//
//  Created by Yvette Zhukovsky on 11/25/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}
struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

//class User: ObservableObject, Codable {
//    enum CodingKeys: CodingKey {
//        case name
//    }
//
//    @Published var name = "Yvette Zhukovsky"
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        name = try container.decode(String.self, forKey: .name)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(name, forKey: .name)
//    }
//}


struct ContentView: View {
    @ObservedObject var order = Order()
     var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(0..<Order.types.count) {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper(value: $order.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.quantity)")
                    }
                }
                    Section {
                        Toggle(isOn: $order.specialRequestEnabled.animation()) {
                            Text("Any special requests?")
                        }
                        
                        if order.specialRequestEnabled {
                            Toggle(isOn: $order.extraFrosting) {
                                Text("Add extra frosting")
                            }
                            
                            Toggle(isOn: $order.addSprinkles) {
                                Text("Add extra Sprinkles")
                            }
                        }
                    }
                    
                
            }
        .navigationBarTitle("Cupcake corner")
        }
    
    
    
    
//    @State private var username = ""
//    @State private var password = ""
//
//    var disabledForm: Bool {
//        username.count < 5 || password.count < 5
//    }
//
//    var body: some View {
//        Form {
//            Section {
//                TextField("Username", text: $username)
//                TextField("Password", text: $password)
//            }
//            Section {
//                Button("Create Account") {
//                    print("creating account")
//                }
//            }
//        .disabled(disabledForm)
//        }
    
//    @State var results = [Result]()
//    var body: some View {
//        List(results, id: \.trackId) { item in
//            VStack(alignment: .leading) {
//                Text(item.trackName)
//                    .font(.headline)
//                Text(item.collectionName)
//            }
//        }
//    .onAppear(perform: loadData)
//    }
//
//    func loadData() {
//        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song")  else {
//            print("invalid url")
//            return
//        }
//        let request = URLRequest(url: url)
//        URLSession.shared.dataTask(with: request) { data, response, error in
//
//            if let data = data {
//                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
//                    DispatchQueue.main.async {
//                        self.results = decodedResponse.results
//                    }
//                    return
//                }
//                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
//            }
//
//        }.resume()
//    }
   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
