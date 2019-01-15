//
//  TheaterListViewController.swift
//  MyMovieChart
//
//  Created by 이동영 on 16/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import Foundation
import UIKit

class TheaterListViewController:UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callByApi()
    }
    var startPoint = 0
    var theaterList : [TheaterVO] = []
    var size = 100
}
// MARK: - 테이블뷰 터치메소드 분리
extension TheaterListViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.theaterList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let theaterCell = self.tableView.dequeueReusableCell(withIdentifier: "TheaterCell") as? TheaterCell ?? TheaterCell()
        theaterCell.theaterName?.text = theaterList[indexPath.row].theaterName
        theaterCell.address?.text = theaterList[indexPath.row].address
        theaterCell.tel?.text = theaterList[indexPath.row].tel
        return theaterCell
    }
}
// MARK : - API 요청부 분리
extension TheaterListViewController{
    func callByApi()->(){
        let uri = "http://swiftapi.rubypaper.co.kr:2029/theater/list?s_page=\(startPoint)&s_list=\(size)&type=json"
        let url = URL(string: uri)!
        let apiData = try! NSString(contentsOf: url, encoding: 0x80_000_422)
        let encodingData = apiData.data(using: String.Encoding.utf8.rawValue)
        do{
            let theatersInfo = try JSONSerialization.jsonObject(with: encodingData!, options: []) as! NSArray
            
            for theaterInfo in theatersInfo {
                let data = theaterInfo as! NSDictionary
                let theater = TheaterVO()
                //    theater.id = (data["_id"] as! NSString).doubleValue
                theater.theaterName = data["상영관명"] as? String
                theater.address = data["소재지지번주소"] as? String
                theater.tel = data["연락처"] as? String
                theater.posX = (data["위도"] as! NSString).doubleValue
                theater.posY = (data["경도"] as! NSString).doubleValue
                self.theaterList.append(theater)
                print(theaterList.count)
            }
            self.startPoint += self.size
        }catch{print("error")}
        
    }
}
// MARK: - 세그웨이 관련메소드
extension TheaterListViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let cell = sender as? UITableViewCell
        if(segue.identifier == "segue_map"){
        let index = self.tableView.indexPath(for: sender as! UITableViewCell)
        (segue.destination as? TheaterViewController)?.theater = theaterList[(index!.row)]
        }
        
    }
}
