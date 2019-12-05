//
//  ImageSaver.swift
//  proect13-CoreImage-another-project
//
//  Created by Yvette Zhukovsky on 12/5/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import UIKit

class ImageSaver: NSObject {
    var successHandler: (()->Void)?
    var errorHandler: ((Error)-> Void)?
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
        
    }
}
