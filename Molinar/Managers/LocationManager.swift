//
//  LocationManager.swift
//  UberSwiftUI
//
//  Created by Matt Molinar on 3/2/23.
//

import CoreLocation


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var currentLocation: CLLocation?
    @Published var currentLocationTitle: String?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func getLocationTitle(for location: CLLocation) {
            let geocoder = CLGeocoder()

            geocoder.reverseGeocodeLocation(location) { placemarks, error in
                if let error = error {
                    print("Error reverse geocoding location: \(error.localizedDescription)")
                    return
                }

                if let placemark = placemarks?.first {
                    let address = "\(placemark.subThoroughfare ?? "") \(placemark.thoroughfare ?? ""), \(placemark.locality ?? ""), \(placemark.administrativeArea ?? "") \(placemark.postalCode ?? ""), \(placemark.country ?? "")"
                    return self.currentLocationTitle = address
                }
            }
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
//        print("Updated Location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
        
        currentLocation = location
        getLocationTitle(for: location)
        
    }

    func getCurrentLocation() -> CLLocationCoordinate2D? {
        return locationManager.location?.coordinate
    }
}


//extension LocationManager: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard !locations.isEmpty else { return }
//        locationManager.stopUpdatingLocation()
//    }
//}
