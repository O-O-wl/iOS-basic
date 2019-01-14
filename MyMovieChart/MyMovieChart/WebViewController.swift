//
//  WebViewController.swift
//  MyMovieChart
//
//  Created by 이동영 on 14/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import Foundation
import WebKit

class WebViewController : UIViewController{
    
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = UserDefaults.standard.url(forKey: "URL")
        let req = URLRequest(url: url!)
        DispatchQueue.main.async {
            self.webView.load(req)
        }
    }
}
