//
//  ViewController.swift
//  Delegate_Test
//
//  Created by 이동영 on 05/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit


class ViewController: UIViewController , UITextFieldDelegate{

    var table = ["1":"tf","2":"imgpkr"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btnOl.layer.cornerRadius = 5
    }
    @IBOutlet var stprOl: UIStepper!
    
    @IBOutlet var btnOl: UIButton!
    
    
    
    @IBAction func stprIncrease(_ sender: UIStepper) {
        tfSegueNumber.text = String(Int(sender.value))
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        stprOl.value = Double(tfSegueNumber.text!)!
        return true
    }
    
    @IBOutlet var tfSegueNumber: UITextField!
    
    @IBAction func btnActionSegue(_ sender: Any) {
        if tfSegueNumber.text! == "0" { return}
        performSegue(withIdentifier: table[tfSegueNumber.text!]!, sender: self)
    }
    
    @IBAction func unWind( _ segue : UIStoryboardSegue){
        
    }
}

