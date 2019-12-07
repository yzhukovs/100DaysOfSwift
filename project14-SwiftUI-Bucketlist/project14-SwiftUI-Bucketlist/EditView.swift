//
//  EditView.swift
//  project14-SwiftUI-Bucketlist
//
//  Created by Yvette Zhukovsky on 12/6/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//
import MapKit
import SwiftUI

struct EditView: View {
    @Environment(\.presentationMode) var presnentationMode
    @ObservedObject var placemark: MKPointAnnotation
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Pleace name", text: $placemark.wrappedTitle)
                    TextField("Description", text: $placemark.wrappedSubTitle)
                }
            }
        .navigationBarTitle("Edit Place")
            .navigationBarItems(trailing: Button("Done"){
                self.presnentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(placemark: MKPointAnnotation.example)
    }
}
