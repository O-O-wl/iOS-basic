//
//  RegisterVC.swift
//  SyncDataTransfer_BackStack
//
//  Created by 이동영 on 04/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import Foundation
import UIKit

class RegisterVC : UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let save = UserDefaults.standard
        tfPage2.text = save.string(forKey: "page1")
        
    }
    @IBOutlet var tfPage2: UITextField!
    
    var page2Data = ""
    
    @IBAction func tfChange(_ sender: Any) {
        page2Data = tfPage2.text!
        let save = UserDefaults.standard
        save.set(page2Data,forKey:"page2")
    }
    
}
