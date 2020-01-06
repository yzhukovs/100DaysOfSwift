//
//  ContentView.swift
//  project16-SwiftUI
//
//  Created by Yvette Zhukovsky on 1/4/20.
//  Copyright © 2020 bumnetworks. All rights reserved.
//

import SwiftUI
import UserNotifications
import SamplePackage

//class DelayedUpdater: ObservableObject {
//    var value = 0 {
//        willSet {
//            objectWillChange.send()
//        }
//    }
//
//    init() {
//        for i in 1...10 {
//            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
//                self.value += 1
//            }
//        }
//    }
//}
//


struct ContentView: View {
    //    let possibleNumbers = Array(1...60)
    //    var results: String {
    //        let selected = possibleNumbers.random(7).sorted()
    //        let strings = selected.map(String.init)
    //        return strings.joined(separator: ", ")
    //    }
    //@ObservedObject var updater = DelayedUpdater()
    // @State private var backgroundColor = Color.red
    var body: some View {
        TabView {
            ProspectsView(filter: .none)
                .tabItem {
                    Image(systemName: "person.3")
                    Text("Everyone")
            }
            ProspectsView(filter: .contacted)
                .tabItem {
                    Image(systemName: "checkmark.circle")
                    Text("Contacted")
            }
            ProspectsView(filter: .uncontacted)
            .tabItem {
                Image(systemName: "questionmark.diamond")
                Text("Uncontacted")
            }
            MeView()
                .tabItem {
                    Image(systemName: "person.crop.square")
                    Text("Me")
            }
            
        }
        
        
        //        VStack {
        //            Button("Request Permission") {
        //                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
        //                    if success {
        //                        print("All set!")
        //                    } else if let error = error {
        //                        print(error.localizedDescription)
        //                    }
        //                }
        //            }
        //            Button("Schedule Notification") {
        //              let content = UNMutableNotificationContent()
        //                content.title = "Feed the cat"
        //                content.subtitle = "It looks hungry"
        //                content.sound = .default
        //
        //                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        //                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        //                UNUserNotificationCenter.current().add(request)
        //            }
        
        // }
        
        
        
        //        VStack {
        //        Text("Hello, World!")
        //            .padding()
        //            .background(backgroundColor)
        //
        //        Text("Change Color")
        //            .padding()
        //            .contextMenu {
        //                Button(action: {
        //                    self.backgroundColor = .red
        //                }) {
        //                    Text("Red")
        //                    Image(systemName: "checkmark.circle.fill")
        //                    .foregroundColor(.blue)
        //                }
        //
        //                Button(action: {
        //                    self.backgroundColor = .green
        //                }) {
        //                    Text("Green")
        //                }
        //
        //                Button(action: {
        //                    self.backgroundColor = .blue
        //                }) {
        //                    Text("Blue")
        //                }
        //            }
        //        }
        
        
        //  Text("Value is: \(updater.value)")
        //        Image("example")
        //        .interpolation(.none)
        //        .resizable()
        //        .scaledToFit()
        //        .frame(maxHeight: .infinity)
        //        .background(Color.black)
        //        .edgesIgnoringSafeArea(.all)
    }
}



