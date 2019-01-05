//
//  ViewController.swift
//  LocalNotification
//
//  Created by 이동영 on 05/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit
import UserNotifications


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    @IBOutlet var tfdContent: UITextField!
    
    @IBOutlet var dpkr: UIDatePicker!
    
    
    
    
    
    /** ========================= 버튼 눌렀을시 ========================= **/
    
    @IBAction func Save(_ sender: Any) {
 
    UNUserNotificationCenter.current().getNotificationSettings(completionHandler: {
        settings in
        
        //==============
        //  알림허용여부
        //==============
        if settings.authorizationStatus == UNAuthorizationStatus.authorized {
            
            /** UI를 건드리기 위해서 메인스레드에서 작업을 강제하기 위한 코드 **/
            DispatchQueue.main.async {
                let nContent = UNMutableNotificationContent()
                nContent.title = "미리 알림"
                nContent.body = self.tfdContent.text!
                nContent.sound = UNNotificationSound.default
                
                let time = self.dpkr.date.timeIntervalSinceNow
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                
                let request = UNNotificationRequest(identifier: "alerm", content: nContent, trigger: trigger)
                
                
                
                //===============================================
                // 요청 객체 등록
                // 트레일링 클로저는 center에 등록이 완료됫을시 실행할 클로저
                //===============================================
                UNUserNotificationCenter.current().add(request){(_) in
                    DispatchQueue.main.async {
                        
                    let date = self.dpkr.date.addingTimeInterval(9*60*60)
                    let message = "알림이 등록되었습니다. 등록된 알림은 \(date)에 발송됩니다."
                    let alert = UIAlertController(title: "알림등록", message: message, preferredStyle: .alert)
                    
                    let ok = UIAlertAction(title: "확인", style:  .default )
                    
                    alert.addAction(ok)
                    
                    self.present(alert, animated: false)
            }
                }
            }
        }else{
            let alert = UIAlertController(title: "알림등록", message: "알림이 허용되어 있지 않습니다.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
            
            alert.addAction(ok)
        
            self.present(alert, animated: true)
            
        }
            
        })
    }
   /** =================================================================== **/
    
    
    
    
}

