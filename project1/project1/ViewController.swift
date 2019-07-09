//
//  ViewController.swift
//  project1
//
//  Created by Yvette Zhukovsky on 6/4/19.
//  Copyright © 2019 Lambda School Labs. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
        performSelector(inBackground: #selector(loadingImages), with: nil)
       tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
    }
    
    
    @objc func loadingImages(){
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
            
        }
        
        print(pictures)
       
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        //var pics = pictures.sorted(by: [indexPath.row])
        cell.textLabel?.text = pictures.sorted()[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.font = UIFont(name: "Times New Roman", size: 18)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            
            vc.selectedImage = pictures[indexPath.row]
            vc.totalImages = pictures.count
            vc.selectedImageNumber = indexPath.row + 1
            
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }

     
}

