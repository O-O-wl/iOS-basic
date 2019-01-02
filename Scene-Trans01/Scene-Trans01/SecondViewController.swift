//
//  SecondViewController.swift
//  Scene-Trans01
//
//  Created by 이동영 on 03/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController : UIViewController{
    
    @IBAction func back(_ sender: Any) {
       
        self.presentingViewController?.dismiss(animated: true)
    }
}
