//
//  TableViewController.swift
//  project4
//
//  Created by Yvette Zhukovsky on 6/11/19.
//  Copyright © 2019 Lambda School Labs. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    var websites = ["apple.com", "hackingwithswift.com"]
    var notAllowed = ["microsoft.com", "google.com"]
    var blocked = ["Blocked", "Not blocked" ]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Web Sites"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return blocked.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return blocked[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return websites.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = notAllowed[indexPath.row]
            
        }
        if indexPath.section == 1 {
            cell.textLabel?.text = websites[indexPath.row]
            
        }
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? ViewController {
            if indexPath.section == 1 {
                let url = URL(string: "https://" + websites[indexPath.row])!
                vc.webView.load(URLRequest(url: url))
                navigationController?.pushViewController(vc, animated: true)
            }
            if indexPath.section == 0 {
                let ac = UIAlertController(title: notAllowed[indexPath.row], message: "\(notAllowed[indexPath.row]) is blocked", preferredStyle: .alert)
                let cancel = UIAlertAction(title: "OK", style: .cancel)
                ac.addAction(cancel)
                present(ac, animated: true)
            }
        }
        
    }
}
