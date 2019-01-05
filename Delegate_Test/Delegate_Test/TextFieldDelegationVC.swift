//
//  TextFieldDelegationVC.swift
//  Delegate_Test
//
//  Created by 이동영 on 05/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import Foundation
import UIKit

class TextFieldDelegationVC : UIViewController,UITextFieldDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tfInput.delegate = self
    }
    
    @IBOutlet var lblInputStatus: UILabel!
    
    @IBOutlet var tfInput: UITextField!
    
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        lblInputStatus.text="입력 중"
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        lblInputStatus.text="--=--"
        
        return true
    }
    
    @IBAction func focusing(_ sender: Any) {
        self.tfInput.becomeFirstResponder()
    }
    @IBAction func blur(_ sender: Any) {
          self.tfInput.resignFirstResponder()
    }
}
