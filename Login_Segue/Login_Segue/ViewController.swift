//
//  ViewController.swift
//  Login_Segue
//
//  Created by 이동영 on 03/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ID: UITextField!
    
    
    @IBOutlet var PW: UITextField!
    

    @IBOutlet var result: UILabel!
    
    @IBAction func logoutAction(_ segue: UIStoryboardSegue){}
    @IBAction func LoginAction(_ sender: UIButton) {
        if(ID.text! == "east0" && PW.text! == "1234"){
        performSegue(withIdentifier: "LoginWind", sender: self )
        }else{
            result.text = "다시 입력해주세요."
        }
                   }

}

