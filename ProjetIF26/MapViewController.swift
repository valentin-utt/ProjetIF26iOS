

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

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let locationUTT = CLLocation(latitude: 48.269126, longitude: 4.066722)
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(locationUTT.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: false)
        
    }

}
