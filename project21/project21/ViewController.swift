//
//  ViewController.swift
//  project21
//
//  Created by Yvette Zhukovsky on 10/18/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerLocal))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerLocal))
    }

    @objc func registerLocal() {
        
    }

    @objc func scheduleLocal(){
        
    }
}

