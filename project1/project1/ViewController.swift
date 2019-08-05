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
    
  
    var dictionary = [Int: Int]()
    
    var pictures = [String]()
   // var numberOftimes = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
      load()
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
        let sortedPictures = pictures.sorted()
        cell.textLabel?.text = sortedPictures[indexPath.row]
       
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.font = UIFont(name: "Times New Roman", size: 18)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            
            vc.selectedImage = pictures[indexPath.row]
            vc.totalImages = pictures.count
            vc.selectedImageNumber = indexPath.row + 1
          
            dictionary[indexPath.row] = dictionary[indexPath.row, default: 0] + 1
            
            let data = try? NSKeyedArchiver.archivedData(withRootObject: dictionary, requiringSecureCoding: false)
            
            UserDefaults.standard.set(data, forKey: "nums")

            var numTimes = 0

            print(dictionary)

            for (key, value) in dictionary {
                if key == indexPath.row {
                 numTimes = value
                }
            }
         
             vc.selectImageTimes = numTimes
            
            
            
          print(numTimes)
            
           //let rows = tableView.indexPathsForSelectedRows.map{$0.map{$0.row}}
            
//            numberOftimes = vc.selectedImageNumber
           
            navigationController?.pushViewController(vc, animated: true)
        }
    }

   
    func load() {
        
       let out = UserDefaults.standard.object(forKey: "nums") as? Data
       dictionary = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(out!) as? [Int: Int] ?? [Int: Int]()
       
    
    }
    
}

