

import UIKit
import GoogleMaps

class MapViewController: UIViewController, GMSMapViewDelegate {

  var locationManager = CLLocationManager()
  var currentLocation: CLLocation?
  var mapView: GMSMapView!
  var zoomLevel: Float = 15.0


  // A default location to use when location permission is not granted.
  let defaultLocation = CLLocation(latitude: 48.269126, longitude: 4.066722)


  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // Initialize the location manager.
    locationManager = CLLocationManager()
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestAlwaysAuthorization()
    locationManager.distanceFilter = 50
    locationManager.startUpdatingLocation()
    locationManager.delegate = self

   

    // Create a map.
    let camera = GMSCameraPosition.camera(withLatitude: defaultLocation.coordinate.latitude,
                                          longitude: defaultLocation.coordinate.longitude,
                                          zoom: zoomLevel)
    mapView = GMSMapView.map(withFrame: view.bounds, camera: camera)
    mapView.settings.myLocationButton = true
    mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    mapView.isMyLocationEnabled = true

    // Add the map to the view, hide it until we&#39;ve got a location update.
    view.addSubview(mapView)
    mapView.isHidden = true


  }


// Delegates to handle events for the location manager.
extension MapViewController: CLLocationManagerDelegate {

  // Handle incoming location events.
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let location: CLLocation = locations.last!
    print(&quot;Location: \(location)&quot;)

    let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                          longitude: location.coordinate.longitude,
                                          zoom: zoomLevel)

    if mapView.isHidden {
      mapView.isHidden = false
      mapView.camera = camera
    } else {
      mapView.animate(to: camera)
    }

  }

  // Handle authorization for the location manager.
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    switch status {
    case .restricted:
      print(&quot;Location access was restricted.&quot;)
    case .denied:
      print(&quot;User denied access to location.&quot;)
      // Display the map using the default location.
      mapView.isHidden = false
    case .notDetermined:
      print(&quot;Location status not determined.&quot;)
    case .authorizedAlways: fallthrough
    case .authorizedWhenInUse:
      print(&quot;Location status is OK.&quot;)
    }
  }

  // Handle location manager errors.
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    locationManager.stopUpdatingLocation()
    print(&quot;Error: \(error)&quot;)
  }
}

