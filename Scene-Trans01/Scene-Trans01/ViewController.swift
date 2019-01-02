//
//  ViewController.swift
//  Scene-Trans01
//
//  Created by 이동영 on 02/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   // let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main <#T##Bundle?#><#T##Bundle?#>)
    
    @IBAction func moveNext(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let uvc = storyboard.instantiateViewController(withIdentifier: "SecondVC")
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        present(uvc,animated: true)
    }
    
}

