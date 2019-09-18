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
    var selectImageTimes = 0
    
    
    let vc = ViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        defaults.set(selectImageTimes, forKey: "viewedTimes")
        let savedTimes = defaults.integer(forKey: "viewedTimes")
        title = ("Picture \(selectedImageNumber) of \(totalImages) & Viewed \(savedTimes) times ")
        navigationItem.largeTitleDisplayMode = .never
        if let imageLoad = selectedImage {
            imageView.image = UIImage(named: imageLoad)
            
        }
        assert(selectedImage != nil, "checking if selected Image always has a value")
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
