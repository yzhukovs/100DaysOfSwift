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
    @IBOutlet var changeFilterButton: UIButton!
    @IBOutlet var radius: UISlider!
    
    var currentImage: UIImage!
    
    var context: CIContext!
    var currentFilter: CIFilter!
    
    override func viewDidLoad() {
        changeFilterButton.titleLabel!.numberOfLines = 0
        changeFilterButton.titleLabel!.adjustsFontSizeToFitWidth = true
        changeFilterButton.titleLabel!.minimumScaleFactor = 0.5
        
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
        UIView.animate(withDuration: 5, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [.transitionCrossDissolve], animations: {
            self.imageView.alpha = 0.1
            self.imageView.alpha = 0.5
            self.imageView.alpha = 1
            
          }) //{ (finished) in
//              self.imageView.alpha = 0.5
//              self.imageView.alpha = 1
//           }
        currentImage = image
        
        let beginImage = CIImage(image: currentImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    @IBAction func intensityChanged(_ sender: Any) {
        applyProcessing()
    }
    
    @IBAction func save(_ sender: Any) {
      //  let image = imageView.image
        guard let image = imageView.image else {
            
            let ac = UIAlertController(title: "Image Error", message: "No Image Selected", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
            return
        }
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError: contextInfo:)), nil)
    }
    
    @IBAction func changeFilter(_ sender: UIButton) {
        let ac = UIAlertController(title: "Choose Filter", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "CIBumpDistortion", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIGaussianBlur", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIPixellate", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CISepiaTone", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CITwirlDistortion", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIUnsharpMask", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "CIVignette", style: .default, handler: setFilter))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        if let popOverController = ac.popoverPresentationController {
            popOverController.sourceView = sender
            popOverController.sourceRect = sender.bounds
        }
        
        present(ac, animated: true)
    }
    
    
    func setFilter(action: UIAlertAction) {
        guard  currentImage != nil  else { return }
        guard let actionTitle = action.title else { return }
        currentFilter = CIFilter(name: actionTitle)
        changeFilterButton.setTitle(actionTitle, for: .normal)
        
        let beginImane = CIImage(image: currentImage)
        currentFilter.setValue(beginImane, forKey: kCIInputImageKey)
        applyProcessing()
      
        
    }
    
    
    @IBAction func radiusControl(_ sender: Any) {
        applyProcessing()
    }
    
    
    func applyProcessing(){
       
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(intensity.value, forKey: kCIInputIntensityKey)
            intensity.isEnabled = true
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(radius.value * 200 , forKey: kCIInputRadiusKey)
            intensity.isEnabled = false
            print(currentFilter!)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(intensity.value * 10 , forKey: kCIInputScaleKey)
            intensity.isEnabled = true
        }
        if inputKeys.contains(kCIInputCenterKey) {
            currentFilter.setValue(CIVector(x: currentImage.size.width / 2, y: currentImage.size.height / 2 ) , forKey: kCIInputCenterKey)
            intensity.isEnabled = true
               }
         guard let outputImage = currentFilter.outputImage else {return}
       
        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            let processedImage = UIImage(cgImage: cgImage)
            imageView.image = processedImage
        }
        
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Save Error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
        
    }
    
}

