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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uri = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=1&count=10&genreId=&order=releasedateasc"
        
        let url = URL(string: uri)!
        
        let apiData = try! Data(contentsOf:url)
        
        let log = NSString(data: apiData, encoding: String.Encoding.utf8.rawValue ) ?? ""
        NSLog("API RESULT = \(log)")
        
    }

    // 정적 데이터
    var dataset = [
    ("다크나이트","영웅물에 철학에 음악까지 더해져 에술이 되다.","2008-09-04",8.95,"darknight.jpg"),
    ("말할수 없는 비밀","여기서 너까지 다섯걸음","2015-05-07",9.19,"secret.jpg"),
    ("너의이름은","아직 만난 적 없는 너를, 찾고 있어","2017-01-07",9.02,"yourname.jpg"),
    ("목소리의 형태","나는 네가 정말 싫었다. 너를 다시 만나기 전까진…","2017-05-09",8.74,"voice.jpg")]
    
    
    //======================================
    //            데이터소스
    //          지연저장 프로퍼티
    //  'lazy'키워드 생략시 dataset 사용불가
    //      메모리 할당시점을 정확히 알수없음
    //======================================
     lazy var movieList : [MovieVO] = {
    
        var datalist = [MovieVO]()
        
        for(title,description,openDate,rating,thumbnail) in self.dataset {
            var movie = MovieVO()
            movie.title = title
            movie.description = description
            movie.openDate = openDate
            movie.rating = rating
            movie.thumbnail=thumbnail
            datalist.append(movie)
        }
        return datalist
    }()
    
    
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
        cell.openDate.text = row.openDate
        cell.rating.text = "\(row.rating!)"
        cell.thumbnail.image = UIImage(named: row.thumbnail!)!
        cell.desc.layer.masksToBounds = true
        cell.desc.layer.cornerRadius = 5
    
        
        
        /*
         태그를 통해 프로토타입셀의 뷰를
         코드에서 터칭가능
       
        let title = cell.viewWithTag(101) as? UILabel
        let description = cell.viewWithTag(102) as? UILabel
        let openDate = cell.viewWithTag(103) as? UILabel
        let rating = cell.viewWithTag(104) as? UILabel
 
        
        title?.text = row.title
        description?.text = row.description
        openDate?.text = row.openDate
        rating?.text = String(row.rating!)
       */
        
        
        
        return cell
        
    }
    
    /******************************
    *       아이템 선택시 호출
    *         콜백메소드
    ******************************/
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택된 행은 \(indexPath.row)번째 행입니다.")
    }
}
