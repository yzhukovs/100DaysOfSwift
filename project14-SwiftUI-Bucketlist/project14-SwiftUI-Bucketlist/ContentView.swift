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

enum ActiveAlert {
    case first, second, third
}

struct ContentView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [CodableMKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    @State private var showingEditScreen = false
    @State private var isUnlocked = false
    @State private var activeAlert: ActiveAlert = .first
    
    var mapView: some View {
         MapView(centerCoordinate: $centerCoordinate,selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
        .edgesIgnoringSafeArea(.all)
    }
    
    var circle: some View {
        Circle()
        .fill(Color.blue)
        .opacity(0.3)
        .frame(width: 32, height: 32)
    }
    
    var button: some View {
        Button(action: {
            //Create a new location
            let newLocation = CodableMKPointAnnotation()
            newLocation.title = "Example Location"
            newLocation.coordinate = self.centerCoordinate
            self.locations.append(newLocation)
            self.selectedPlace = newLocation
            self.showingEditScreen = true
            
        })
        {
            Image(systemName: "plus")
                            .padding()
                           .background(Color.black.opacity(0.75))
                           .foregroundColor(.white)
                           .font(.title)
                           .clipShape(Circle())
                           .padding(.trailing)
        }
    }
    
    var body: some View {
        ZStack {
            if isUnlocked {
            mapView
            circle
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    button
               
                }
            }
            } else {
                Button("Unlock Places") {
                    self.authenticate()
                }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
                
            }
        }
        
        
        return showAlert(title: selectedPlace?.title ?? "Unknown", msg: selectedPlace?.title ?? "Unknown", primarybtn: "OK!", secndButton: "Edit", binding: $showingPlaceDetails, completion: {_ in
            self.showingEditScreen = true
        })
                
//            .alert(isPresented: $showingPlaceDetails) {
//                Alert(title: Text(selectedPlace?.title ?? "Unknown"), message: Text(selectedPlace?.subtitle ?? "Missing place Information"), primaryButton: .default(Text("OK!")), secondaryButton: .default(Text("Edit")){
//                    self.showingEditScreen = true
//                    })
//            }
         
        
        .sheet(isPresented: $showingEditScreen, onDismiss: saveData ) {
            if self.selectedPlace != nil {
                EditView(placemark: self.selectedPlace!)
            }
        }
    .onAppear(perform: loadData)
    }
    
    func getDocumentsDirectory()-> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadData() {
        let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
        do {
          let data = try Data(contentsOf: filename)
            locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
        } catch {
            print("Unable to load data")
        }
    }
    
    func saveData(){
        do {
            let filename = getDocumentsDirectory().appendingPathComponent("SavedPlaces")
            let data = try JSONEncoder().encode(self.locations)
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        let reason = "Please authentica yourself to unlock your places"
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success , authenticationError in
            DispatchQueue.main.async {
                if success {
                    self.isUnlocked = true
                } else {
                    self.isUnlocked = false
                }
            
            }
        }
        } else {
            //no biometry
        }
    }
    
//    func showAlert(title:String, msg: String, primarybtn: String, secndButton: String, binding: Binding<Bool>, completion: (bind: Binding<Bool>)-> Void) -> some View {
//         return self.alert(isPresented: binding) {
//            Alert(title: Text(title), message: Text(msg), primaryButton: .default(Text(primarybtn)), secondaryButton: .default(Text(secndButton)){
//                
//                
//                })
//        }
//    }
//    
//}
//

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
