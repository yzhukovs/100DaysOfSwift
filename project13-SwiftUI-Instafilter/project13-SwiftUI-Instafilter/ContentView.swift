//
//  ContentView.swift
//  project13-SwiftUI-Instafilter
//
//  Created by Yvette Zhukovsky on 12/3/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins



struct ContentView: View {
    @State private var image: Image?
    var body: some View {
        VStack {
            image?
            .resizable()
            .scaledToFit()
        }
    .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        guard let inputImage = UIImage(named: "hi") else {
            return
        }
        let beginImage = CIImage(image: inputImage)
        let context = CIContext()
        let currentFilter = CIFilter.pixellate()
        currentFilter.inputImage = beginImage
        currentFilter.scale = 100
        
        guard let outputImage = currentFilter.outputImage else {
            return
        }
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
        let uiImage = UIImage(cgImage: cgImage)
            image = Image(uiImage: uiImage)
        }
    }
}


















//struct ContentView: View {
//    @State private var showingActionSheet = false
//    @State private var backgroundColor = Color.white
//var body: some View {
//Text("Hello, World!")
//    .frame(width: 300, height: 300)
//    .background(backgroundColor)
//    .onTapGesture {
//        self.showingActionSheet = true
//    }
//.actionSheet(isPresented: $showingActionSheet) {
//    ActionSheet(title: Text("Change background"), message: Text("Select a new color"), buttons: [
//        .default(Text("Red")) { self.backgroundColor = .red},
//        .default(Text("Green")) { self.backgroundColor = .green},
//        .default(Text("Blue")) { self.backgroundColor = .blue },
//        .cancel()
//        ])
//        }
//    }
//}

//struct ContentView: View {
//    @State private var blurAmount: CGFloat = 0
//
//    var body: some View {
//        let blur = Binding<CGFloat>(
//            get: {
//                self.blurAmount
//        },
//            set: {
//                self.blurAmount = $0
//                print("New Value is \(self.blurAmount)")
//            }
//        )
//
//        return VStack {
//        Text("Hello, World!")
//            .blur(radius: blurAmount)
//        Slider(value: blur, in: 1...20)
//         }
//    }
//}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
