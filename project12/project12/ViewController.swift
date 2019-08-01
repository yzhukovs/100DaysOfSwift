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
        defaults.set("Yvette", forKey: "name")
        defaults.set(Date(), forKey: "lastRun")
        let array = ["Hello", "World"]
        defaults.set(array, forKey: "SavedArray")
        let dict = ["Name":"Yvette", "Country": "US"]
        defaults.set(dict, forKey: "SavedDict")
        
        let savedInteger = defaults.integer(forKey: "age")
        let savedBool = defaults.bool(forKey: "userFaceID")
        
        let savedArray = defaults.object(forKey: "SavedArray") as? [String] ?? [String]()
        let savedDict = defaults.object(forKey: "SavedDict") as? [String: String] ?? [String: String]()
    }


}

