//
//  ViewController.swift
//  HelloWorld
//
//  Created by 이동영 on 01/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var uiTitle: UILabel!
    
    var name : String? = "손님"
    

    @IBAction func userName(_ sender: UITextField) {
        self.name=sender.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
 
    
    @IBAction func sayHello(_ sender: Any) {
        self.uiTitle.text = "Hello, \(self.name!)!"
        
    }
    
    
}

