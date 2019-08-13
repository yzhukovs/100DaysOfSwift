//
//  ViewController.swift
//  project5
//
//  Created by Yvette Zhukovsky on 6/12/19.
//  Copyright © 2019 Lambda School Labs. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var allWords = [String]()
    var usedWords = [String]()
    // var savedAllWords = UserDefaults.standard.object(forKey: "allWords") as? [String]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector (promptForAnswer))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(startGame))
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                //   UserDefaults.standard.set(allWords, forKey: "allWords")
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        title = UserDefaults.standard.string(forKey: "selectedWord")
        //startGame()
    }
    
    @objc func startGame() {
        let selectedWord = allWords.randomElement()
        UserDefaults.standard.set(selectedWord, forKey: "selectedWord")
        let savedSelectedWord = UserDefaults.standard.string(forKey: "selectedWord")
        print(selectedWord)
        print(savedSelectedWord)
        title = savedSelectedWord
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
        UserDefaults.standard.removeObject(forKey: "usedWords")
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count is \(usedWords.count)")
        let savedUsedWords = UserDefaults.standard.object(forKey: "usedWords") as? [String] ?? [String]()
        return savedUsedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
         let savedUsedWords = UserDefaults.standard.object(forKey: "usedWords") as? [String] ?? [String]()
        cell.textLabel?.text = savedUsedWords[indexPath.row]
        return cell
    }
    
    @objc func promptForAnswer(){
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let sumbitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else {return}
            self?.submit(answer)
        }
        ac.addAction(sumbitAction)
        present(ac, animated: true)
    }
    
    func submit(_ answer: String){
        let lowerAnswer = answer.lowercased()
       
        if isPossible(word: lowerAnswer) {
            if isOridinal(word: lowerAnswer) {
                if isReal(word: lowerAnswer) {
                    usedWords.insert(answer , at: 0)
                    UserDefaults.standard.set(usedWords, forKey: "usedWords")
                    let indexPath = IndexPath(row: 0, section: 0)
                    tableView.insertRows(at: [indexPath], with: .automatic)
                    return
                } else {
                    showErrorMessage(errorTitle: "Word not recognized", errorMessage: "You can't just make them up, you know!")
                }
            } else {
                showErrorMessage(errorTitle: "Word already used", errorMessage: "Be more original!")
            }
        }else {
            showErrorMessage(errorTitle: "Word not possible", errorMessage: "You can't spell that word from \(title!.lowercased())!")
            
        }
    }
    
    
    func showErrorMessage(errorTitle: String, errorMessage: String ){
        let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK!", style: .default))
        present(ac, animated: true)
        
    }
    
    func isPossible(word: String)-> Bool {
        guard var tempWord = title?.lowercased() else {return false}
        for letter in word {
            if let position = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: position)
            } else {
                return false
            }
        }
        return true
    }
    
    func isOridinal(word: String)-> Bool {
        return !usedWords.contains(word)
    }
    
    func isReal(word: String)-> Bool {
        if word == title!.lowercased() {
            return false
        }
        
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count )
        if  word.count < 3 { return false }
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
}

