//
//  WebViewController.swift
//  project16
//
//  Created by Yvette Zhukovsky on 9/13/19.
//  Copyright © 2019 bumnetworks. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    var url: Capital?
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        NSLog("before using it")
        guard let url = url?.url else {
        return}
           webView.load(URLRequest(url: url))
        NSLog("after using it")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
    }
    

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
       title = webView.title
   }
}
