//
//  LocationManager.swift
//  UberSwiftUI
//
//  Created by Matt Molinar on 3/2/23.
//

import CoreLocation


class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // Check if the user has granted permission to access location data
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        } else {
            locationManager.stopUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        // Check if the location data is valid
        guard location.horizontalAccuracy > 0 else { return }
        
        // Do something with the updated location data
        print("Updated Location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
    }

    func getCurrentLocation() -> CLLocation? {
        return locationManager.location
    }
}


//extension LocationManager: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard !locations.isEmpty else { return }
//        locationManager.stopUpdatingLocation()
//    }
//}
