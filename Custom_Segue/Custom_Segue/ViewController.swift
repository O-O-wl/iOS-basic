//
//  ViewController.swift
//  Custom_Segue
//
//  Created by 이동영 on 04/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        btn1.layer.cornerRadius=5
        btn2.layer.cornerRadius=5
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBOutlet var btn1: UIButton!
    
    @IBOutlet var btn2: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "custom" {
            NSLog("custom 버튼 클릭")
        }else{
            NSLog("Action 버튼클릭")
            
        }
    }
    
}

