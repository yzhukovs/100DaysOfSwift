//
//  ImagePicker.swift
//  proect13-CoreImage-another-project
//
//  Created by Yvette Zhukovsky on 12/4/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
        let parent: ImagePicker
        init(_ parent: ImagePicker){
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
}
