//
//  MapboxMap.swift
//  Molinar
//
//  Created by Matt Molinar on 2/10/23.
//

import Foundation
import UIKit
import MapboxMaps
import SwiftUI
import CoreLocation

class MapboxView: UIViewController, CLLocationManagerDelegate {
    var counter = 0
    internal var mapView: MapView!
    private let locationManager = CLLocationManager()



    
    override public func viewDidLoad() {
        super.viewDidLoad()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        

        
//        let centerCoordinate = CLLocationCoordinate2D(latitude: 30.280, longitude: -97.735)
        
        
        
        
       
        let cameraOptions = CameraOptions(center: CLLocationCoordinate2D(latitude: locationManager.location!.coordinate.latitude, longitude: locationManager.location!.coordinate.longitude),
                                          zoom: 18.00,
                                          bearing: -168.00,
                                          pitch: 80)
        
        
        


        
        let myResourceOptions = ResourceOptions(accessToken: "pk.eyJ1Ijoibm92ZWxpY2EiLCJhIjoiY2xjdmF0NjR6MHMwZjN3cmxnMHFpaGFjMSJ9.bBri5mIGTCFnINYa75jS4w")
        let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions, cameraOptions: cameraOptions, styleURI: StyleURI(rawValue: "mapbox://styles/novelica/cldzj4ky0003h01qkjx9xqfhk"))
        mapView = MapView(frame: view.bounds, mapInitOptions: myMapInitOptions)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.ornaments.compassView.isHidden = true
        mapView.ornaments.scaleBarView.isHidden = true
        mapView.ornaments.logoView.isHidden = true
        mapView.ornaments.attributionButton.isHidden = true
        mapView.preferredFramesPerSecond = 60 // Increase the frame rate of the mapView


//        var pointAnnotation = PointAnnotation(coordinate: centerCoordinate)
//        pointAnnotation.image = .init(image: UIImage(named: "red_pin")!, name: "red_pin")
//        pointAnnotation.iconAnchor = .bottom
//        let pointAnnotationManager = mapView.annotations.makePointAnnotationManager()
//        pointAnnotationManager.annotations = [pointAnnotation]
        // Fetch the `gltf` asset
        let uri = Bundle.main.url(forResource: "locationPuck",
                                         withExtension: "glb")
        let locationModel = Model(uri: uri, orientation: [0, 0, 180])
        // Setting an expression to  scale the model based on camera zoom
               let scalingExpression = Exp(.interpolate) {
                   Exp(.linear)
                   Exp(.zoom)
                   0
                   Exp(.literal) {
                       [256000.0, 256000.0, 256000.0]
                   }
                   4
                   Exp(.literal) {
                       [40000.0, 40000.0, 40000.0]
                   }
                   8
                   Exp(.literal) {
                       [2000.0, 2000.0, 2000.0]
                   }
                   12
                   Exp(.literal) {
                       [100.0, 100.0, 100.0]
                   }
                   16
                   Exp(.literal) {
                       [7.0, 7.0, 7.0]
                   }
                   20
                   Exp(.literal) {
                       [1.0, 1.0, 1.0]
                   }
               }
        let configuration = Puck3DConfiguration(model: locationModel, modelScale: .expression(scalingExpression), modelOpacity: .constant(1))
        mapView.location.options.puckType = .puck3D(configuration)
        mapView.location.options.puckBearingSource = .course




        
        

        self.view.addSubview(mapView)
        

        
    }
    
    // MARK: - CLLocationManagerDelegate
        
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
            counter += 1
            print("DEBUG: Updated Location \(counter)")
            
            // Check if the location data is valid
            guard location.horizontalAccuracy > 0 else { return }
            
            // Set camera options with user's current location
            let cameraOptions = CameraOptions(center: location.coordinate,
                                              zoom: 18.00,
                                              bearing: -168.00,
                                              pitch: 80)
        
        

        mapView.camera.ease(to: cameraOptions, duration: 3.0)
//            mapView.camera.makeAnimator(duration: 2.0, curve: .easeInOut)
            // Stop updating location to conserve battery
            // removed this bc it seems to hinder the camera pan functionality, and I saw that it's not actually running this all the time?( Line 82.)
//            locationManager.stopUpdatingLocation()
        }
    
    
}

struct MapboxRepresentable: UIViewControllerRepresentable {
    @EnvironmentObject var mapboxViewModel: MapboxViewModel

    func makeUIViewController(context: Context) -> MapboxView {
        return mapboxViewModel.mapboxView

    }
    
    func updateUIViewController(_ uiViewController: MapboxView, context: Context) {
        
    }
    
    
    
}

