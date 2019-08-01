//
//  ViewController.swift
//  project12
//
//  Created by Yvette Zhukovsky on 8/1/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       let defaults = UserDefaults.standard
        defaults.set(25, forKey: "age")
        defaults.set(true, forKey: "userFaceID")
        defaults.set(CGFloat.pi, forKey: "Pi")
    }


}

