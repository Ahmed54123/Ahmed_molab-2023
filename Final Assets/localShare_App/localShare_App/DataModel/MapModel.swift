//
//  ContentViewModel.swift
//  UserLocation
//
//  Created by ahmed casual on 11/2/23.
//
import MapKit

enum MapDetails{
    
    static let startingLocation = CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891054)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
    
}
final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span:
                                                MapDetails.defaultSpan)
    
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            
        }
        else {
            print("Show alert letting them know its off and turn it on")
        }
    }
    
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus {
            
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            
        case.restricted:
           print("Your location is restricted")
            
        case.denied:
            print("You have denied location access")
            
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                        span: MapDetails.defaultSpan)
            
            
        @unknown default:
            break
        }
        
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
}
