//
//  WebViewController.swift
//  MyMovieChart
//
//  Created by 이동영 on 14/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import Foundation
import WebKit

class WebViewController : UIViewController{
    
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = UserDefaults.standard.url(forKey: "URL"){
            let req = URLRequest(url: url)
            //DispatchQueue.main.async {
            /// - Note: 웹뷰의 load 메소드는 네트워크상의 HTML문서요청하는 비동기 메소드
                self.webView.load(req)
           // }
        }else {
            let alert = UIAlertController()
            alert.title = "오류!"
            alert.message = "넘어온 데이터가 없습니다."
            let cancel = UIAlertAction(title: "이전페이지로", style: .cancel, handler: {(_) in
                _=self.navigationController?.popViewController(animated: false)
                
            })
            
            alert.addAction(cancel)
            self.present(alert, animated: false, completion: nil)
            
        }
        
        
    }
}
