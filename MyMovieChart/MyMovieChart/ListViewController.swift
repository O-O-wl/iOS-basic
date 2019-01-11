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
    
    
    var dataset = [
    ("다크나이트","영웅물에 철학에 음악까지 더해져 에술이 되다.","2008-09-04",8.95),
    ("말할수 없는 비밀","여기서 너까지 다섯걸음","2015-05-07",9.19),
    ("너의이름은","아직 만난 적 없는 너를, 찾고 있어","2017-01-07",9.02)]
    
     lazy var movieList : [MovieVO] = {
    
        var datalist = [MovieVO]()
        
        for(title,description,openDate,rating) in self.dataset {
            var movie = MovieVO()
            movie.title = title
            movie.description = description
            movie.openDate = openDate
            movie.rating = rating
            datalist.append(movie)
        }
        return datalist
    }()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.movieList[ indexPath.row ]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        cell.textLabel?.text = row.title
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택된 행은 \(indexPath.row)번째 행입니다.")
    }
}
