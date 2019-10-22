//
//  ViewController.swift
//  project21
//
//  Created by Yvette Zhukovsky on 10/18/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Register", style: .plain, target: self, action: #selector(registerLocal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Schedule", style: .plain, target: self, action: #selector(scheduleLocal))
    }

    @objc func registerLocal() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yay!")
            } else {
                print("D'oh!")
            }
        }
        
    }

    @objc func scheduleLocal(){
        registerCategories()
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        center.removeAllPendingNotificationRequests()
        content.title = "Late wake up call"
        content.body = "The early birds get catches the warm, but the second mouse gets the cheese"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = .default
        
        var dateComponents = DateComponents()
        dateComponents.hour  = 10
        dateComponents.minute = 30
       // let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        let secondTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 86400, repeats: false)
        let secondsRequest = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: secondTrigger)
        center.add(request)
        center.add(secondsRequest)
        
    }
    
    func registerCategories(){
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        let show = UNNotificationAction(identifier: "show", title: "Tell me more", options: .foreground)
        let secondAlert = UNNotificationAction(identifier: "show", title: "Remind me later", options: .foreground)
        let category = UNNotificationCategory(identifier: "alarm", actions: [show, secondAlert], intentIdentifiers: [], options: [])
        
        
        center.setNotificationCategories([category])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        
        if let customData = userInfo["customData"] as? String {
            print("custom Data received \(customData)")
            switch response.actionIdentifier {
            case UNNotificationDefaultActionIdentifier:
                let ac = UIAlertController(title: "User Swipped", message: nil, preferredStyle: .actionSheet)
                ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                present(ac, animated: true)
                
                print("Default identifier")
            case "show":
                let ac = UIAlertController(title: "User Asked More Information", message: nil, preferredStyle: .actionSheet)
                ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                present(ac, animated: true)
                
                print("show more information")
            default:
                break
            }
        }
        completionHandler()
    }
}

