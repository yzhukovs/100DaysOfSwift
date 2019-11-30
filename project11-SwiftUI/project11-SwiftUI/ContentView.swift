//
//  ContentView.swift
//  project11-SwiftUI
//
//  Created by Yvette Zhukovsky on 11/29/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI

//struct PushButton: View {
//    let title: String
//    @Binding  var isOn: Bool
//
//    var onColor = [Color.red, Color.yellow]
//    var offColor = [Color(white: 0.6), Color(white: 0.4)]
//    var body: some View {
//        Button(title) {
//            self.isOn.toggle()
//        }
//    .padding()
//    .background(LinearGradient(gradient: Gradient(colors: isOn ? onColor: offColor), startPoint: .top, endPoint: .bottom))
//    .foregroundColor(.white)
//    .clipShape(Capsule())
//    .shadow(radius: isOn ? 0 : 5 )
//    }
//}

struct ContentView: View {
   // @State private var rememberMe = false
     @Environment(\.horizontalSizeClass) var sizeClass
    var body: some View {
        if sizeClass == .compact {
            return AnyView(VStack {
                Text("Active size class:")
                Text("COMPACT")
            }
            .font(.largeTitle))
        } else {
            return AnyView(HStack {
                Text("Active size class:")
                Text("REGULAR")
            }
            .font(.largeTitle))
        }
    
//    VStack {
//        PushButton(title: "Remember Me", isOn:  $rememberMe)
//        Text(rememberMe ? "On" : "Off")
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
