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
    
    @IBOutlet var idcLoading: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.navigationDelegate = self
        self.webView.uiDelegate = self
        
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
// MARK: - WKNavigationDelegate 델리게이트 구현부
extension WebViewController : WKNavigationDelegate{
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.idcLoading.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        /// - Note:  인디케이터뷰의 behavior 속성이 'Hidden When Stopped' 이므로 이시점에서 Hidden 됨
         self.idcLoading.stopAnimating()
    }
   // webview
    
}
// MARK: - WKUIDelegate 델리게이트 구현부
extension WebViewController : WKUIDelegate{
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.idcLoading.stopAnimating()
        alert("상세페이지를 불러오지 못했습니다"){
             _ = self.navigationController?.popViewController(animated: false)
        }
        
     }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.idcLoading.stopAnimating()
        alert("상세페이지를 불러오지 못했습니다"){
            _ = self.navigationController?.popViewController(animated: false)
        }
    }
}
// MARK: - Alert 부분 분리
extension UIViewController {
    func alert(_ message:String , onClick: (() -> Void)? = nil){
  //  self.idcLoading.stopAnimating()
    let alert =  UIAlertController(title: "네트워크오류", message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "확인", style: .cancel, handler:{ (_) in onClick?()})
    alert.addAction(cancel)
       // DispatchQueue.main.async {
             self.present(alert, animated: false, completion: nil)
       // }
   
}
}




