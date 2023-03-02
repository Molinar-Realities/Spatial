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

class MapboxView: UIViewController {
    internal var mapView: MapView!

    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        let centerCoordinate = CLLocationCoordinate2D(latitude: 30.280, longitude: -97.735)
        
        


        
        let myResourceOptions = ResourceOptions(accessToken: "pk.eyJ1Ijoibm92ZWxpY2EiLCJhIjoiY2xjdmF0NjR6MHMwZjN3cmxnMHFpaGFjMSJ9.bBri5mIGTCFnINYa75jS4w")
        let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions, styleURI: StyleURI(rawValue: "mapbox://styles/novelica/cldzj4ky0003h01qkjx9xqfhk"))
        mapView = MapView(frame: view.bounds, mapInitOptions: myMapInitOptions)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.ornaments.compassView.isHidden = true
        mapView.ornaments.scaleBarView.isHidden = true
        mapView.ornaments.logoView.isHidden = true
        mapView.ornaments.attributionButton.isHidden = true

        var pointAnnotation = PointAnnotation(coordinate: centerCoordinate)
        pointAnnotation.image = .init(image: UIImage(named: "red_pin")!, name: "red_pin")
        pointAnnotation.iconAnchor = .bottom
        let pointAnnotationManager = mapView.annotations.makePointAnnotationManager()
        pointAnnotationManager.annotations = [pointAnnotation]
        
        
        
        self.view.addSubview(mapView)
        
    }
}

struct MapboxRepresentable: UIViewControllerRepresentable {
    @EnvironmentObject var mapboxViewModel: MapboxViewModel
    let locationManager = LocationManager()

    func makeUIViewController(context: Context) -> MapboxView {
        return mapboxViewModel.mapboxView

    }
    
    func updateUIViewController(_ uiViewController: MapboxView, context: Context) {
        
    }
    
    
    
}

