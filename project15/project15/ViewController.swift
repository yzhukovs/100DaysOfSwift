//
//  ViewController.swift
//  project15
//
//  Created by Yvette Zhukovsky on 8/24/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imageView: UIImageView!
    var currentAnimation = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
    }

    @IBAction func tapped(_ sender: Any) {
        currentAnimation += 1
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
    
}

