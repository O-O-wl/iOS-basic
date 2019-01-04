//
//  ResultVC.swift
//  PresentSubmitValue
//
//  Created by 이동영 on 04/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import Foundation
import UIKit

class ResultVC : UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultEmail.text=resultEmailInfo
        resultUpdateOnoff.text = resultUpdateInfo ? "ON" : "OFF"
        resultUpdateInterval.text = "\(resultIntervalInfo)분마다"
    }
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdateOnoff: UILabel!
    @IBOutlet var resultUpdateInterval: UILabel!
    
    var resultEmailInfo = ""
    var resultUpdateInfo = false
    var resultIntervalInfo = 0
    
   
}
