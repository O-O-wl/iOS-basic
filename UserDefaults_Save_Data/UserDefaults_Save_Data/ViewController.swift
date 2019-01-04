//
//  ViewController.swift
//  UserDefaults_Save_Data
//
//  Created by 이동영 on 04/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet var tfPage1: UITextField!
    
    @IBAction func btnPage1(_ sender: Any) {
      let store =  UserDefaults.standard
        store.set(tfPage1.text, forKey:"page1")
        performSegue(withIdentifier: "testSegue", sender: self)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let store =  UserDefaults.standard
        guard let page2 = store.string(forKey: "page2")else{return } 
        tfPage1.text = page2
        
    }
    
    
}

