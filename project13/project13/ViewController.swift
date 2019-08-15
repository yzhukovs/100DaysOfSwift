//
//  ViewController.swift
//  project13
//
//  Created by Yvette Zhukovsky on 8/12/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//
import CoreImage
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var intensity: UISlider!
    @IBOutlet var imageView: UIImageView!
    var currentImage: UIImage!
    
    var context: CIContext!
    var currentFilter: CIFilter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Instafilter"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPictures))
        context = CIContext()
        currentFilter = CIFilter(name: "CISepiaTone")
        
    }

    
    @objc func importPictures () {
        
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {return}
        dismiss(animated: true)
        currentImage = image
        
        let beginImage = CIImage(image: currentImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    @IBAction func intensityChanged(_ sender: Any) {
    }
    
    @IBAction func save(_ sender: Any) {
    }
    
    @IBAction func changeFilter(_ sender: Any) {
        applyProcessing()
    }
    
    func applyProcessing(){
        currentFilter.setValue(intensity.value, forKey: kCIInputIntensityKey)
        if let cgImage = context.createCGImage(currentFilter.outputImage!, from: currentFilter.outputImage!.extent) {
            let processedImage = UIImage(cgImage: cgImage)
            imageView.image = processedImage
        }
        
    }
    
}

