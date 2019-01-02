//
//  ViewController.swift
//  Scene-Trans02
//
//  Created by 이동영 on 03/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func moveByNavi(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC")
            
            else{
                return
        }
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.navigationController?.pushViewController(uvc, animated:true)
    }
    
    @IBAction func movePresent(_ sender: Any) {
        let uvc = self.storyboard!.instantiateViewController(withIdentifier: "SecondVC")
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        present(uvc,animated: true)
    }
}

