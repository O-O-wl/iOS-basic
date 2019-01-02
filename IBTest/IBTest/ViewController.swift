//
//  ViewController.swift
//  IBTest
//
//  Created by 이동영 on 02/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet var uiTitle01: UILabel!
    @IBOutlet var uiTitle02: UILabel!
    @IBOutlet var uiTitle03: UILabel!
    @IBOutlet var uiTitle04: UILabel!
    @IBOutlet var uiTitle05: UILabel!
    
    
    @IBAction func clickBtn01(_ sender: Any) {
        self.uiTitle01.text="Button01 Cilicked"
    }
    @IBAction func clickBtn02(_ sender: Any) {
         self.uiTitle02.text="Button02 Cilicked"
    }
    
    @IBAction func clickBtn03(_ sender: Any){
        self.uiTitle03.text="Button03 Cilicked"
    }
    @IBAction func clickBtn04(_ sender: Any){
         self.uiTitle04.text="Button04 Cilicked"
    }
    
    @IBAction func clickBtn05(_ sender: Any) { self.uiTitle05.text="Button05 Cilicked"
    }
}

