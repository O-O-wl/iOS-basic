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
        self.tfInput.text = userEmail
        self.swUpdate.isOn = self.userUpdate
        self.stprInterval.value = Double(self.userUpdateInterval)
        
    }
   // 이메일 텍스트 필드
    @IBOutlet var tfInput: UITextField!
   // 간격 스태퍼
    @IBOutlet var stprInterval: UIStepper!
   // 갱신여부 스위치
    @IBOutlet var swUpdate: UISwitch!
    
    @IBOutlet var lbUpdate: UILabel!
    

    @IBOutlet var lbInterval: UILabel!
    
    @IBAction func swUpdateOnOff(_ sender: Any) {
        lbUpdate.text = swUpdate.isOn ? "자동갱신" : "수동갱신"
    }
    
    @IBAction func tfEmail(_ sender: Any) {
        
    }
    @IBAction func stprUpdateInterval(_ sender: Any) {        lbInterval.text = "\(Int(stprInterval.value))분마다"
    }
    
    var userEmail = ""
    var userUpdate = false
    var userUpdateInterval = 0

    
    
}
