//
//  MapVC.swift
//  Clinica
//
//  Created by htu on 8/30/22.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var MapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        if isLocationServiceEnabled(){
            checkAuthrization()
            
        }else{
            showAlert(msg: "Please enable the location service")
            
        }
        

        let initialLocation = CLLocation(latitude: 31.9539, longitude: 35.9106)
        
        setStartingLocation(location: initialLocation, distance: 1000)
        addAnNotation()
    }
    
    

    func setStartingLocation(location : CLLocation , distance : CLLocationDistance){
        
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distance, longitudinalMeters: distance)
        MapView.setRegion(region, animated: true)
        MapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 30000)
        MapView.setCameraZoomRange(zoomRange, animated: true)
    }

    func addAnNotation(){
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: 31.9539, longitude: 35.9106)
        pin.title = "My Title"
        pin.subtitle = " My Pin SubTitle"
        MapView.addAnnotation(pin)
        
    }
    
    func isLocationServiceEnabled() ->Bool{
        
        return CLLocationManager.locationServicesEnabled()
    }

    
    func checkAuthrization(){
        
        switch CLLocationManager.authorizationStatus() {
            case .notDetermined:
            
                 locationManager.requestWhenInUseAuthorization()
                 break
            
            case .authorizedWhenInUse:
                 locationManager.startUpdatingLocation()
                 MapView.showsUserLocation = true
                break
            
            case .authorizedAlways:
                  locationManager.startUpdatingLocation()
                  MapView.showsUserLocation = true
                  break
            
            case .denied:
                 showAlert(msg: "Please authorize access to location")
                break
             
            case .restricted:
                 showAlert(msg: "authorization restricted")
                  break
            
            
        default:
            print("default...")
            break
        }
    
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            
            print("location :\(location.coordinate)")
        }
        
    
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
       
            
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            MapView.showsUserLocation = true
            break
            
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
                       MapView.showsUserLocation = true
            break
            
        case .denied:
            showAlert(msg: "Please authorize access to location")
            break
            
        
            
            
        default:
            print("default...")
            break
        }
        locationManager.stopUpdatingLocation()
    }
    
    
    
    func zoomToUserLocation(location :CLLocation){
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        
        MapView.setRegion(region, animated: true)
        print("location : \(location.coordinate)")
        zoomToUserLocation(location: location)
        
    }
    
    func showAlert(msg : String){
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "close", style: .default))
        present(alert,animated: true,completion: nil)
        
        
    }
    
    
}
