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
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}


extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locations.isEmpty else { return }
        locationManager.stopUpdatingLocation()
    }
}