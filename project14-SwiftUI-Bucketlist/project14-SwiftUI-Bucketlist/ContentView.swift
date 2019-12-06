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
    
    var body: some View {
        ZStack {
            MapView(centerCoordinate: $centerCoordinate)
                .edgesIgnoringSafeArea(.all)
                Circle()
                    .fill(Color.blue)
                    .opacity(0.3)
                    .frame(width: 32, height: 32)
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
