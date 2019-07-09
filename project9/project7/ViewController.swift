//
//  ViewController.swift
//  project7
//
//  Created by Yvette Zhukovsky on 6/14/19.
//  Copyright © 2019 Lambda School Labs. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [Petition]()
    var filteredPetitions = [Petition]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(credits))
         navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterData))
        
        
        performSelector(inBackground: #selector(fetchJason), with: nil)
    }
    
    
    
   @objc func fetchJason() {
        let urlString: String
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        }else {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
            
        }
        
        
            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url) {
                    parse(json: data)
                }else {
                    performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
                }
            } else {
                performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
           
        }
    }
    
    
    @objc func filterData(){
        let ac = UIAlertController(title: "Enter search", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let sumbitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else {return}
            self!.filteredPetitions.removeAll(keepingCapacity: true)
            for items in self!.petitions {
                if items.body.contains(answer) || items.title.contains(answer) {
                    self!.filteredPetitions.append(items)
                   
                }
            }
            //self!.filteredPetitions = self!.petitions.filter { $0.body == answer }
            self!.tableView.reloadData()
        }
        ac.addAction(sumbitAction)
        present(ac, animated: true)
    }
    
    
    @objc func credits(){
        let ac = UIAlertController(title: "Credits", message: "The data is taken from Whitehouse Petitions", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK!", style: .default))
        present(ac, animated: true)
        
    }
    
  @objc func showError(){
        let ac = UIAlertController(title: "Loading Error", message: "There was an error loading data; check your connection and try again", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK!", style: .default))
        present(ac, animated: true)
    
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            filteredPetitions = petitions
            performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
        } else {
            performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredPetitions.count
        //petitions.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = filteredPetitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = filteredPetitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

