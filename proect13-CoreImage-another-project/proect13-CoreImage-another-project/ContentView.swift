//
//  ContentView.swift
//  proect13-CoreImage-another-project
//
//  Created by Yvette Zhukovsky on 12/4/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var showingFilterSheet = false
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var isThereImage = false
    @State private var buttonName = "Change Filter"
    let context = CIContext()
    
    var body: some View {
        let intensity = Binding<Double>(
            get: {self.filterIntensity},
            set: { self.filterIntensity = $0
                   self.applyProcessing()
        }
        )

       return NavigationView {
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
                    self.showingImagePicker = true
                    //select an Image
                }
                HStack {
                    Text("Intensity")
                    Slider(value: intensity)
                }
                .padding(.vertical)
                
                HStack {
                    Button(self.buttonName){
                        self.showingFilterSheet = true
                    }
                    Spacer()
                    Button("Save") {
                        if self.processedImage == nil {
                            self.isThereImage = true
                        }
                        guard let processedImage = self.processedImage else {return}
                        let imageSaver = ImageSaver()
                        imageSaver.successHandler = {
                            print("success!")
                        }
                        imageSaver.errorHandler = {
                            print("Oops: \($0.localizedDescription)")
                        }
                        imageSaver.writeToPhotoAlbum(image: processedImage)
                       
                        
                    }
                    .alert(isPresented: $isThereImage) {
                    Alert(title: Text("⚠️ Alert"), message: Text("Please pick an Image first"), dismissButton: .destructive(Text("OK")))
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Instafilter")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
            .actionSheet(isPresented: $showingFilterSheet) {
                ActionSheet(title: Text("Select a filter"), buttons: [
                    .default(Text("Crystalize")) {
                        self.buttonName = "Crystalize"
                        self.setFilter(CIFilter.crystallize())},
                    .default(Text("Edges")) {
                        self.buttonName = "Edges"
                    self.setFilter(CIFilter.edges())},
                    .default(Text("Gaussian Blur")) {
                        self.buttonName = "Gaussian Blur"
                    self.setFilter(CIFilter.gaussianBlur())},
                    .default(Text("Pixellete")) {
                        self.buttonName = "Pixellete"
                    self.setFilter(CIFilter.pixellate())},
                    .default(Text("Sepiatone")) {
                        self.buttonName = "Sepiatone"
                    self.setFilter(CIFilter.sepiaTone())},
                    .default(Text("Unsharp Mask")) {
                        self.buttonName = "Unsharp Mask"
                    self.setFilter(CIFilter.unsharpMask())},
                    .default(Text("Vignette")) {
                        self.buttonName = "Vignette"
                    self.setFilter(CIFilter.vignette())},
                    .cancel()
                    
                ])
                //action sheet here
        }
        
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else {
            return
        }
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
            if inputKeys.contains(kCIInputIntensityKey) {
                currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
                currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
                currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
        }
        guard let outputImage = currentFilter.outputImage else {return}
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
        
    }
    
    func setFilter(_ filter: CIFilter){
        currentFilter = filter
        loadImage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
