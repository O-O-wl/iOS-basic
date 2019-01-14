//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by 이동영 on 10/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import Foundation
import UIKit


class ListViewController : UITableViewController{
    
    var page = 1
    var total = 10;
    var detailUrl : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        callByApi()
    }

    func callByApi(){
        
        // 영화목록 API  URI
        let uri = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=10&genreId=&order=releasedateasc"
        
        //URL객체로 타입캐스팅
        let url = URL(string: uri)!
        
        // 데이터 불러오기
        let apiData = try! Data(contentsOf:url)
        
        /**========================
         / 데이터객체를 문자열객체로 인코딩
         ========================*/
      //  let log = NSString(data: apiData, encoding: String.Encoding.utf8.rawValue ) ?? ""
       // NSLog("API RESULT = \(log)")
        
        do{
            /// - Note: JSON 파싱 구현부 -- 핸들링 메소드가 많은 파운데이션 프레임웤의 NS 타입으로 변환
            let apiDictionary = try JSONSerialization.jsonObject(with: apiData, options: []) as! NSDictionary
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let totalCount = (hoppin["totalCount"] as! NSString).integerValue
            self.total = totalCount
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            for row in movie {
                
                /// - Note: NSDictionary , NSArray 의
                /// - Returns:  `Any` 이므로 타입 캐스팅필요
                let r = row as! NSDictionary
                
                
                let mvo = MovieVO()
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.rating = (r["ratingAverage"] as! NSString).doubleValue
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                //mvo.thumbnailImage = UIImage(data: try! Data(contentsOf: URL(string: mvo.thumbnail!)!))
                self.movieList.append(mvo)
            }
            
            self.tableView.reloadData()
        }catch{}
        
    }
    /**
   
    - Note: 정적데이터 활용후 네트워크 api 로 대체
    var dataset = [
    ("다크나이트","영웅물에 철학에 음악까지 더해져 에술이 되다.","2008-09-04",8.95,"darknight.jpg"),
    ("말할수 없는 비밀","여기서 너까지 다섯걸음","2015-05-07",9.19,"secret.jpg"),
    ("너의이름은","아직 만난 적 없는 너를, 찾고 있어","2017-01-07",9.02,"yourname.jpg"),
    ("목소리의 형태","나는 네가 정말 싫었다. 너를 다시 만나기 전까진…","2017-05-09",8.74,"voice.jpg")]
    ================================================================================== */
    
    //======================================
    //            데이터소스
    //          지연저장 프로퍼티
    //  'lazy'키워드 생략시 dataset 사용불가
    //      메모리 할당시점을 정확히 알수없음
    //======================================
 
    var movieList : [MovieVO] = []
    /**
    *****************************************
    *
    *    이미 있는 테이블뷰의 행의수를 반환하는게 아니라
    *       앞으로 생성할 테이블뷰의 행의 수를 설정
    *
    ******************************************
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieList.count
    }

    
    //==============================
    //
    //    테이블셀 생성 하는 메소드
    //
    //==============================
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.movieList[ indexPath.row ]
        
        // 재사용큐 리사이클큐를 이용하여 이미 생성된 셀인지 확인후 생성 혹은 탐색 후 반환
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        cell.title.text = row.title
        cell.desc.text = row.description
       // cell.openDate.text = row.openDate
        cell.rating.text = "\(row.rating!)"
        // 이미지 URL 변환
       // let imgUrl : URL! = URL(string: row.thumbnail!)
        // 바이너리 데이터를 URL로 변환
        DispatchQueue.main.async {
            cell.thumbnail.image = self.getImage(indexPath.row)
        }
     //   cell.thumbnail.image = row.thumbnailImage
        cell.desc.layer.masksToBounds = true
        cell.desc.layer.cornerRadius = 5
    
        return cell
        
        /**
         - Note:태그를 통해 프로토타입셀의 뷰를 코드에서 터칭가능
         
        let title = cell.viewWithTag(101) as? UILabel
        let description = cell.viewWithTag(102) as? UILabel
        let openDate = cell.viewWithTag(103) as? UILabel
        let rating = cell.viewWithTag(104) as? UILabel
 
        title?.text = row.title
        description?.text = row.description
        openDate?.text = row.openDate
        rating?.text = String(row.rating!)
       */
        
    }
    
    /******************************
    *       아이템 선택시 호출
    *         콜백메소드
    ******************************/
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택된 행은 \(indexPath.row)번째 행입니다.")
        self.detailUrl = self.movieList[indexPath.row].detail
        let selectedUrl = URL(string: self.detailUrl!)!
        UserDefaults.standard.set(selectedUrl, forKey: "URL")
        performSegue(withIdentifier: "webView", sender: self)
    }
    @IBOutlet var btnMore: UIButton!
    
    @IBAction func more(_ sender: Any) {
        self.page = self.page+1
        if self.movieList.count > total {
            btnMore.isHidden = true  }
        callByApi()
        
    }
    //==================================
    //      스크롤시 매번 호출되는
    //      cellForRowAt에서
    //    계속적으로 호출되므로 분리
    //    메모이제이션을 통해 네트워크연결횟수 감소
    //==================================
    func getImage(_ index : Int) -> UIImage {
        let mvo = self.movieList[index]
        if let savedImage = mvo.thumbnailImage {
            
            return savedImage
        }else {
            let uri = mvo.thumbnail
            let url = URL(string: uri!)
            
            let imageData = try! Data(contentsOf: url!)
            mvo.thumbnailImage = UIImage(data: imageData)!
            print("\(index)번째 이미지를 네트워크상에 요청합니다")
            return mvo.thumbnailImage!
        }
      
    }
    
}

