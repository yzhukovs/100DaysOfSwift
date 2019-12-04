//
//  ContentView.swift
//  proect13-CoreImage-another-project
//
//  Created by Yvette Zhukovsky on 12/4/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)
                    if image != nil {
                        image?
                        .resizable()
                        .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture {
                    //select an Image
                }
                HStack {
                    Text("Intensity")
                    Slider(value:self.$filterIntensity)
                }
                .padding(.vertical)
                
                HStack {
                    Button("Change Filter"){
                        //Change filter
                    }
                    Spacer()
                    Button("Save") {
                        //Save the picture
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Instafilter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
