

//
//  MapViewController.swift
//  ProjetIF26
//
//  Created by Vincent on 17/12/2018.
//  Copyright © 2018 GUILLOUX Valentin. All rights reserved.

//
import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let locationUTT = CLLocation(latitude: 48.269126, longitude: 4.066722)
        
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(locationUTT.coordinate, regionRadius, regionRadius)
        
        mapView.setRegion(coordinateRegion, animated: false)
    }
    

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
