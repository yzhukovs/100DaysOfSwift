//
//  ActionViewController.swift
//  Extension
//
//  Created by Yvette Zhukovsky on 9/18/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//


import UIKit
import MobileCoreServices

class ActionViewController: UIViewController {
    @IBOutlet var script: UITextView!

    var pageTitle = ""
    var pageURL = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(callAlerts))

        
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

        if let inputItem = extensionContext!.inputItems.first as? NSExtensionItem {
            if let itemProvider = inputItem.attachments?.first {
                itemProvider.loadItem(forTypeIdentifier: kUTTypePropertyList as String) { [unowned self] (dict, error) in
                    let itemDictionary = dict as! NSDictionary
                    let javaScriptValues = itemDictionary[NSExtensionJavaScriptPreprocessingResultsKey] as! NSDictionary

                    self.pageTitle = javaScriptValues["title"] as! String
                    self.pageURL = javaScriptValues["URL"] as! String

                    DispatchQueue.main.async {
                        self.title = self.pageTitle
                    }
                }
            }
        }
    }
    
    @objc func callAlerts(){
        
    let ac = UIAlertController(title: "Choose Action", message: nil, preferredStyle: .actionSheet)
                  ac.addAction(UIAlertAction(title: "Alert", style: .default, handler: alertAction))
        ac.addAction(UIAlertAction(title: "Prompt Alert", style: .default, handler: promptAction))
           present(ac, animated: true)
}

    @IBAction func done() {
        let item = NSExtensionItem()
        let argument: NSDictionary = ["customJavaScript": script.text]
        let webDictionary: NSDictionary = [NSExtensionJavaScriptFinalizeArgumentKey: argument]
        let customJavaScript = NSItemProvider(item: webDictionary, typeIdentifier: kUTTypePropertyList as String)
        item.attachments = [customJavaScript]

        extensionContext!.completeRequest(returningItems: [item])
    }

    func alertAction(action: UIAlertAction)
    {
        script.text = "alert(document.title);"
        done()
    }
    func promptAction(action: UIAlertAction)
       {
           script.text = "window.prompt(document.title);"
           done()
       }
    
    @objc func adjustForKeyboard(notification: Notification) {
        let userInfo = notification.userInfo!

        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            script.contentInset = UIEdgeInsets.zero
        } else {
            script.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }

        script.scrollIndicatorInsets = script.contentInset

        let selectedRange = script.selectedRange
        script.scrollRangeToVisible(selectedRange)
    }
}



//keyboardViewEndFrame.height - view.safeAreaInsets.bottom
