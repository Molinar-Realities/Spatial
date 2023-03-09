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
import Combine


class MapboxView: UIViewController, CLLocationManagerDelegate {
    internal var mapView: MapView!
    private let locationManager = LocationManager()
    private var cancellables = Set<AnyCancellable>()
    var tasksViewModel: TasksViewModel?
    private var pointAnnotationManager: PointAnnotationManager?
    var annotations: [PointAnnotation] = []


    
//    private func updateMapCamera(to coordinate: CLLocationCoordinate2D) {
//            let cameraOptions = CameraOptions(center: coordinate, zoom: 18.0)
//            mapView.camera.ease(to: cameraOptions, duration: 3.0)
//        }
    
    // MARK: - Methods
    private var shouldFollowUser = true
    
    
    // MARK: - Annotations
    private func addAnnotations() {
        guard let pointAnnotationManager = pointAnnotationManager else {
                return
            }
        
        let currentDate = Date()
        let currentCalendar = Calendar.current
        
        for task in tasksViewModel!.userTasks.filter({ task in
            return task.dueDate!.isToday
        }) {
            
            
            
            var taskCoordinate = task.coordinate
            var taskId = task.id
            
            if annotations.isEmpty {
                var pointAnnotation = PointAnnotation(id: taskId, coordinate: taskCoordinate)
                pointAnnotation.image = .init(image: UIImage(named: "red_pin")!, name: "red_pin")
                pointAnnotation.iconAnchor = .bottom
                annotations.append(pointAnnotation)
            } else {
                // check if this task is already an annotation
                if !annotations.contains(where: {$0.id == taskId}) {
                    var pointAnnotation = PointAnnotation(id: taskId, coordinate: taskCoordinate)
                    pointAnnotation.image = .init(image: UIImage(named: "red_pin")!, name: "red_pin")
                    pointAnnotation.iconAnchor = .bottom
                    annotations.append(pointAnnotation)
                }
            }
                        
            
        }
        
        pointAnnotationManager.annotations = annotations
    }
    
    


    private func updateMapCamera(to coordinate: CLLocationCoordinate2D) {
        if shouldFollowUser {
            let cameraOptions = CameraOptions(center: coordinate, zoom: 17.00)
            mapView.camera.ease(to: cameraOptions, duration: 3.0)
        }
    }

    @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            // Stop following the user when the camera is manually moved
            shouldFollowUser = false
        case .ended, .cancelled:
            // Start following the user again when the camera is released
            shouldFollowUser = true
        default:
            break
        }
    }


    // MARK: - ViewDidload
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Initialize pointAnnotationManager
            
        
        
        
        
        
        // Subscribe to updates of the current location
                locationManager.$currentLocation
                    .compactMap { $0 }
                    .sink { [weak self] location in
                        self?.updateMapCamera(to: location.coordinate)
                    }
                    .store(in: &cancellables)

        guard let currentLocation = locationManager.getCurrentLocation() else {
                // Handle the case where the user has not granted location permissions or location data is not available
                return
            }
        let cameraOptions = CameraOptions(center: locationManager.getCurrentLocation(),
                                          zoom: 10.00,
                                              bearing: -168.00,
                                              pitch: 80)
        let myResourceOptions = ResourceOptions(accessToken: "pk.eyJ1Ijoibm92ZWxpY2EiLCJhIjoiY2xjdmF0NjR6MHMwZjN3cmxnMHFpaGFjMSJ9.bBri5mIGTCFnINYa75jS4w")
        let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions, cameraOptions: cameraOptions, styleURI: StyleURI(rawValue: "mapbox://styles/novelica/cldzj4ky0003h01qkjx9xqfhk"))
        mapView = MapView(frame: view.bounds, mapInitOptions: myMapInitOptions)
        let pointAnnotationManager = mapView.annotations.makePointAnnotationManager()
        self.pointAnnotationManager = pointAnnotationManager

        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.ornaments.compassView.isHidden = true
        mapView.ornaments.scaleBarView.isHidden = true
        mapView.ornaments.logoView.isHidden = true
        mapView.ornaments.attributionButton.isHidden = true
        mapView.preferredFramesPerSecond = 60 // Increase the frame rate of the mapView
        
        // Subscribe to the updates of the taskViewModel instance
        tasksViewModel!.$userTasks
                    .sink { [weak self] _ in
                        // Call the function to add the annotations to the mapView
                        self?.addAnnotations()
                    }
                    .store(in: &cancellables)


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
        

        
//        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
//        mapView.addGestureRecognizer(panGestureRecognizer)
        self.view.addSubview(mapView)

    }
    
    // MARK: - CLLocationManagerDelegate
        
        
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.first else { return }
            
            // Check if the location data is valid
            guard location.horizontalAccuracy > 0 else { return }
        
            
            // Set camera options with user's current location
            let cameraOptions = CameraOptions(center: location.coordinate,
                                              zoom: 18.00,
                                              bearing: -168.00,
                                              pitch: 80)
        
        print("within mapview: \(location.coordinate.latitude) \(location.coordinate.longitude)")
        
        

//        if shouldFollowUser {
//            mapView.camera.ease(to: cameraOptions, duration: 3.0)
//        }
        //            mapView.camera.makeAnimator(duration: 2.0, curve: .easeInOut)
            // Stop updating location to conserve battery
            // removed this bc it seems to hinder the camera pan functionality, and I saw that it's not actually running this all the time?( Line 82.)
//            locationManager.stopUpdatingLocation()
        }
    
    
}

struct MapboxRepresentable: UIViewControllerRepresentable {
    @EnvironmentObject var mapboxViewModel: MapboxViewModel
    @EnvironmentObject var tasksViewModel: TasksViewModel

    func makeUIViewController(context: Context) -> MapboxView {
        mapboxViewModel.mapboxView.tasksViewModel = tasksViewModel
        return mapboxViewModel.mapboxView

    }
    
    func updateUIViewController(_ uiViewController: MapboxView, context: Context) {
        
    }
    
    
    
}

