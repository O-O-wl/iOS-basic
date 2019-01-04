//
//  ViewController.swift
//  PresentSubmitValue
//
//  Created by 이동영 on 04/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 업데이트 여부 라벨
    @IBOutlet var lbUpdate: UILabel!
    
    // 갱신 주기 라벨
    @IBOutlet var lbInterval: UILabel!
    
    // 이메일 입력 텍스트필드
    @IBOutlet var tfInput: UITextField!
    
    // 자동갱신 스위치
    @IBOutlet var swUpdate: UISwitch!
    
    // 갱신주기 스탭퍼
    @IBOutlet var stpUpdateInterval: UIStepper!
    
    // 이메일 텍스트필드
    @IBAction func tfEmail(_ sender: Any) {
    }
    
    // 스태퍼 액션메소드
    @IBAction func stpUpdateIntervalChange(_ sender: Any) {
        lbInterval.text = "\(Int(stpUpdateInterval.value))분마다"
    }
    
    // 스위치 액션메소드
    @IBAction func swUpdateOnOff(_ sender: Any) {
        lbUpdate.text=swUpdate.isOn ? "자동갱신":"수동갱신"
    }
    
    
    // 전송버튼 메소드
    @IBAction func submit(_ sender: Any) {
        
        
       guard let rvc = self.storyboard!.instantiateViewController(withIdentifier: "RVC") as? ResultVC
        else{return}
        
        
        rvc.resultIntervalInfo = Int(self.stpUpdateInterval.value)
        rvc.resultUpdateInfo = self.swUpdate.isOn
        rvc.resultEmailInfo = self.tfInput.text!
        
        
        self.present(rvc, animated: true)
        
}
}

