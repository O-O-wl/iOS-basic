//
//  ListViewController.swift
//  Table-CellHeight
//
//  Created by 이동영 on 11/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import Foundation
import UIKit

class ListViewController : UITableViewController{
    
    override func viewWillAppear(_ animated: Bool) {
        //======================
        // 콘텐츠배치전의 대충의 높이값
        //======================
        self.tableView.estimatedRowHeight = 50
        
        /************************************
         *       테이블뷰 전체목록 생성시점에
         *           콘텐츠레이아웃에
         *           따른 높이 재설정
         ***********************************/
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    var list = [String]()
    
    @IBAction func add(_ sender: Any) {
        
        let alert = UIAlertController(title: "목록 입력", message: "추가될 글을 작성해주세요.", preferredStyle: .alert)
        
        //==================================
        // 매개변수 클로저는 텍스트필드 셋팅하는 클로저
        //==================================
        alert.addTextField{
            (tf) in
            tf.placeholder = "내용을 입력해주세요."
        }
        
        // -------------------------------   등록버튼  -----------------------------
        let ok = UIAlertAction(title: "등록", style: .default){(_) in
            if let title = alert.textFields?[0].text{
                
                // 입력받은 값 리스트에 푸쉬
                self.list.append(title)
                /** ++++++++++++++++++++++
                        테이블뷰 갱신
                 +++++++++++++++++++++ **/
                self.tableView.reloadData()
            }
            
        }
        //-------------------------------------------------------------------------
        
        
        /**--------------------------------- 취소버튼 ----------------------------------*/
         let cancel = UIAlertAction(title: "취소", style: .cancel){(_) in }
        alert.addAction(ok)
        alert.addAction(cancel)
            self.present(alert, animated: false)
    }
        /**----------------------------------------------------------------------------*/
    
    //===================================
    //테이블뷰에 생성될 셀 의 갯수 설정하는 메소드
    //===================================
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    /***************************
    *    셀 생성후 반환하는 메소드   *
    ****************************/
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = list[indexPath.row]
        
        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        //      재사용큐에서 탐색후 반환 없으면 새로생성
        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell") ?? UITableViewCell()
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = row
        
        return cell
    }
    /**
     -- 직접 셀의 높이 반환.  ! 개발자 직접 계산
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = self.list[indexPath.row]
        
        //==============================
        // 문자열 30글자마다 20의 높이증가
        //==============================
        let height = CGFloat(60 + (row.count / 30) * 20)
        print(height)
        return height
    }
 */
    
}
