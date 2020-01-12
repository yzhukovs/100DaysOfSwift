//
//  MeView.swift
//  project16-SwiftUI
//
//  Created by Yvette Zhukovsky on 1/6/20.
//  Copyright © 2020 bumnetworks. All rights reserved.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct MeView: View {
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    @State private var name = "anonymoys"
    @State private var emailAddress = "you@yoursite.com"
    var body: some View {
        NavigationView {
            VStack {
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)
                    .padding(.horizontal)
                TextField("Email address", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .font(.title)
                    .padding([.horizontal, .bottom])
                Spacer()
            }
        .navigationBarTitle("Your code")
        }
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
