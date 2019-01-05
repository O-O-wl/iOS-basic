//
//  ViewController.swift
//  Scene-Trans01
//
//  Created by 이동영 on 02/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var loginResult: UILabel!
    
    @IBAction func login(_ sender: Any) {
        let loginAlert = UIAlertController(title: "사용자인증", message: "ID , PW 입력해주세요.", preferredStyle: .alert)
        loginAlert.addTextField(configurationHandler:{
            $0.placeholder="ID"
            
        })
        loginAlert.addTextField(configurationHandler:{
            $0.placeholder="PW"
            $0.isSecureTextEntry = true
            
            
            
        })
        let logbtn =  UIAlertAction(title: "로그인", style: .default, handler:{ (_ ) in
            self.loginResult.text =
                (loginAlert.textFields![0].text == "이동영" && loginAlert.textFields![1].text == "1234") ? "성공" : "실패"
                
            })
        
            loginAlert.addAction(logbtn)
        
        
        present(loginAlert,animated: true)

        
    }
    
    
}

