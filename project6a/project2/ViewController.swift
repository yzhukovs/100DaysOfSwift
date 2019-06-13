//
//  ViewController.swift
//  project2
//
//  Created by Yvette Zhukovsky on 6/5/19.
//  Copyright © 2019 Lambda School Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    
    @IBOutlet var button2: UIButton!
    
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany","ireland", "italy", "monaco", "nigeria", "poland", "russia","spain", "uk","us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
          button2.layer.borderColor = UIColor.lightGray.cgColor
          button3.layer.borderColor = UIColor.lightGray.cgColor
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil){
       
        correctAnswer = Int.random(in: 0...2)
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
       button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
            title = countries[correctAnswer].uppercased() + " score: \(score)"
        
           
    
    }
    var counter: Int = 0
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
            if sender.tag == correctAnswer {
                title = "Correct Answer"
                score += 1
            } else {
                title = "Wrong! That’s the flag of \(countries[sender.tag].uppercased())"
                score -= 1
                
            }
            counter += 1
        print(counter)
        if counter != 10 {
            let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "You guessed 10 times ", message: "Your score is \(score), Do you want to continue?", preferredStyle: .alert)
            let yes = UIAlertAction(title: "YES", style: .default, handler:askQuestion )
            let no = UIAlertAction(title: "NO", style: .cancel) { (action) -> Void in
                self.button1.alpha = 0
                self.button2.alpha = 0
                self.button3.alpha = 0
            }
            //ac.addAction(UIAlertAction(title: "Dismiss", style: .destructive, handler: askQuestion))
            ac.addAction(yes)
            ac.addAction(no)
            present(ac, animated: true)
           
           
        }
    }
}

