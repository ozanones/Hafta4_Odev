//
//  LocationPermissionViewController.swift
//  BasicUIComponents
//
//  Created by Ozan Deniz Ones on 22.09.2021.
//

import UIKit
import MapKit
import CoreLocation

class LocationPermissionViewController: UIViewController, MKMapViewDelegate{

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        checkLocationStatus()
        
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
    }
    
    public func checkLocationStatus() {
        switch locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        case .denied, .restricted:  // this is where we use information pop up to show user to go to settings
            let alert = UIAlertController(title: "Konum İzni Gerekiyor!", message: "Ayarlara Gitmeniz Gerekiyor", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ayarlar'a Git", style: UIAlertAction.Style.default, handler: { (alert: UIAlertAction!) in
                            print("")
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
                        }))
            self.present(alert, animated: true, completion: nil)
                        
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        @unknown default:
            fatalError()
        }
    }
}

extension LocationPermissionViewController: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationStatus()
    }
}

