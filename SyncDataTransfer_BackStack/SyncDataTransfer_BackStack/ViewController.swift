//
//  ViewController.swift
//  SyncDataTransfer_BackStack
//
//  Created by 이동영 on 04/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet var lbUserEmail: UILabel!
    @IBOutlet var lbUserUpdate: UILabel!
    @IBOutlet var lbUserUpdateInterval: UILabel!
    
    var userEmail = "미등록"
    var userUpdate = false
    var userUpdateInterval = 0
    
    @IBOutlet var gotoRegister: UIButton!
    
    @IBAction func gotoR(_ sender: Any) {
        performSegue(withIdentifier: "RegisterSegue", sender: self)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let registerVC = segue.destination as? RegisterVC
        
        registerVC?.userUpdate=self.userUpdate
        registerVC?.userEmail=self.userEmail
        registerVC?.userUpdateInterval=self.userUpdateInterval
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.lbUserEmail.text = userEmail
        self.lbUserUpdate.text = self.userUpdate ? "자동갱신":"수동갱신"
        self.lbUserUpdateInterval.text = "\(userUpdateInterval)분마다"
    }
    
    
    @IBAction func unWind(_ VC : UIStoryboardSegue){
        let rvc =  VC.destination as! RegisterVC
        // unWind 시 RegisterVC 의 인스턴스는 메모리에서 헤제되므로 참조불가
        // 런타임 에러
        self.userEmail = (rvc.userEmail)
        self.userUpdateInterval = ((rvc.userUpdateInterval))
        self.userUpdate = (rvc.userUpdate)
        
    }
    
}

