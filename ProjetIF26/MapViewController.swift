

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
    var userLocation:CLLocation = CLLocation()
    let regionRadius: CLLocationDistance = 1000

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
        
        mapView.delegate=self
        mapView.register(CacheAnnotationView.self,
                         forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        let cacheDAO:CacheDAO = CacheDAO()
        let cacheTable = cacheDAO.getAllCache()
        
        for cache in cacheTable {
            let addedCacheAnnotation = CacheAnnotation( id: cache.getId(), type: cache.getType(), coordinate: CLLocationCoordinate2D(latitude: cache.getLat(),longitude: cache.getLon()) )
            mapView.addAnnotation(addedCacheAnnotation)
        }
        
        

        //let userLocation:CLLocation = CLLocation(latitude: 48.269126, longitude: 4.066722)
        //let coordinateRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, regionRadius, regionRadius)
        //mapView.setRegion(coordinateRegion, animated: false)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        determineMyCurrentLocation()
    }
    
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        // manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: false)


    }
    
    var selectedAnnotation: MKAnnotation!
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        selectedAnnotation = view.annotation
        self.performSegue(withIdentifier: "annotation", sender: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is AddCacheViewController {
            let vc = segue.destination as? AddCacheViewController
            vc?.lat = userLocation.coordinate.latitude
            vc?.lon = userLocation.coordinate.longitude
        }
        if segue.identifier == "annotation" {
            let cacheTVC = segue.destination as! CacheTableViewController
            cacheTVC.annotation = (selectedAnnotation as! CacheAnnotation)
            //cacheTVC = selectedAnnotation as! CacheAnnotation
        }
    }
    
}
