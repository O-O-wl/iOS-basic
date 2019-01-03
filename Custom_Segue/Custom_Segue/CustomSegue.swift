//
//  customSegue.swift
//  Custom_Segue
//
//  Created by 이동영 on 04/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import Foundation
import UIKit

class CustomSegue :UIStoryboardSegue{
    override func perform() {
        let srcVC = self.source
        let desinationVC = self.destination
        
        UIView.transition(from: srcVC.view, to: desinationVC.view, duration:  1, options: .transitionCurlUp, completion: nil)
        
    }
}
