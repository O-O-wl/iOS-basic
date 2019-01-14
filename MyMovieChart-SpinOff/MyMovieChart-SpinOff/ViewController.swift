//
//  ViewController.swift
//  MyMovieChart-SpinOff
//
//  Created by 이동영 on 14/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      //  self.tableView1.delegate = self
      //  self.tableView1.dataSource = self
    }


    @IBOutlet var tableView1: UITableView!
    @IBOutlet var tableView2: UITableView!
    
    
}

// MARK: 테이블뷰 델리게이트
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableView == tableView1){
            self.tableView2.delegate = self
            self.tableView2.dataSource = self
            self.tableView2.reloadData()
        }
        else{
            self.tableView1.delegate = self
            self.tableView1.dataSource = self
            self.tableView1.reloadData()
        }
        
    }
}
// MARK: 테이블뷰 데이터소스
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView == self.tableView1 ? tableView.dequeueReusableCell(withIdentifier: "cell1")! : tableView.dequeueReusableCell(withIdentifier: "cell2")!
        cell.textLabel?.text = "\(indexPath.row)번째 셀입니다"
        return cell
        
    }
    
    
}

