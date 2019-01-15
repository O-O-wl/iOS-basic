//
//  TheaterViewController.swift
//  MyMovieChart
//
//  Created by 이동영 on 16/01/2019.
//  Copyright © 2019 이동영. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class TheaterViewController:UIViewController{
    
    @IBOutlet var map: MKMapView!
    var theater : TheaterVO?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = theater?.theaterName
        let location = CLLocationCoordinate2D(latitude: (theater?.posX)!, longitude: (theater?.posY)!)
        let distance : CLLocationDistance = 100
        
        let region  = MKCoordinateRegion.init(center: location, latitudinalMeters: distance, longitudinalMeters: distance)
        
       self.map.setRegion(region, animated: true)
        
        let point = MKPointAnnotation()
        point.coordinate = location
        point.title = theater?.theaterName
        point.subtitle = theater?.address
        self.map.addAnnotation(point)
        
        
    
    }
}
