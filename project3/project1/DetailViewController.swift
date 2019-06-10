//
//  DetailViewController.swift
//  project1
//
//  Created by Yvette Zhukovsky on 6/5/19.
//  Copyright © 2019 Lambda School Labs. All rights reserved.
//

import UIKit


@available(iOS 13.0, *)
class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var totalImages: Int = 0
    var selectedImageNumber = 0
    
   let vc = ViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        title = ("Picture \(selectedImageNumber) of \(totalImages)")
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageLoad = selectedImage {
            imageView.image = UIImage(named: imageLoad)
            
        }
        // Do any additional setup after loading the view.
    }
    
    
    @objc func shareTapped(){
        let imageName = [selectedImage]
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("no image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, imageName], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
         navigationController?.hidesBarsOnTap = false
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
