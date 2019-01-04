//
//  ViewController.swift
//  SyncDataTransfer_BackStack
//
//  Created by 이동영 on 04/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var tfPage1: UITextField!
    
    
    
    @IBAction func gotoR(_ sender: Any) {
        let save = UserDefaults.standard
        
        save.set(tfPage1.text!, forKey: "page1")
        
        performSegue(withIdentifier: "RegisterSegue", sender: self)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            }
    
    override func viewWillAppear(_ animated: Bool) {
        let save = UserDefaults.standard
        guard let data = save.string(forKey:"page2")  else {
            return
        }
         tfPage1.text = data
    }
    
    
    @IBAction func unWind(_ VC : UIStoryboardSegue){
      
     
    }
    
}

