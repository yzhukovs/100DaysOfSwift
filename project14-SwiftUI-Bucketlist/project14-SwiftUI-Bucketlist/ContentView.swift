//
//  ContentView.swift
//  project14-SwiftUI-Bucketlist
//
//  Created by Yvette Zhukovsky on 12/5/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//
import LocalAuthentication
import SwiftUI
import MapKit


struct ContentView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [MKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    
    var body: some View {
        ZStack {
            MapView(centerCoordinate: $centerCoordinate,selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
                .edgesIgnoringSafeArea(.all)
                Circle()
                    .fill(Color.blue)
                    .opacity(0.3)
                    .frame(width: 32, height: 32)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        //Create a new location
                        let newLocation = MKPointAnnotation()
                        newLocation.title = "Example Location"
                        newLocation.coordinate = self.centerCoordinate
                        self.locations.append(newLocation)
                    }) {
                        Image(systemName: "plus")
                    }
                .padding()
                .background(Color.black.opacity(0.75))
                .foregroundColor(.white)
                .font(.title)
                .clipShape(Circle())
                .padding(.trailing)
                }
            }
        }
        
        .alert(isPresented: $showingPlaceDetails) {
            Alert(title: Text(selectedPlace?.title ?? "Unknown"), message: Text(selectedPlace?.subtitle ?? "Missing place Information"), primaryButton: .default(Text("OK!")), secondaryButton: .default(Text("Edit")){
                //Edit this place
                })
        }
    }
}


//struct ContentView: View {
//    @State private var isUnlocked = true
//    var body: some View {
//        VStack {
//            if self.isUnlocked {
//                Text("Unlocked")
//            } else {
//                Text("Locked")
//            }
//        }
//    .onAppear(perform: authenticate)
//        }
//    func authenticate() {
//        let context = LAContext()
//        var error: NSError?
//
//        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
//            let reason = "We need to unlock your data"
//            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticanError in
//                DispatchQueue.main.async {
//                    if success {
//                        self.isUnlocked = true
//                        //authenticated successfully
//                    } else {
//                      //there was a problem
//                    }
//                }
//
//            }
//        } else {
//            //there is no biometrics
//        }
//    }
//
//    }
    
//    func getsDocumentDirectory()-> URL {
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        return paths[0]
//    }
//
//    var body: some View {
//       Text("Hello World")
//        .onTapGesture {
//            let str = "Test Message"
//            let url = self.getsDocumentDirectory().appendingPathComponent("message.txt")
//            do {
//                try str.write(to: url, atomically: true, encoding: .utf8)
//                let input = try String(contentsOf: url)
//                print(input)
//
//            } catch {
//                print(error.localizedDescription)
//
//            }
//
//
//        }
//    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
