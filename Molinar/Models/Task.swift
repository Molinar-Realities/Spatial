//
//  Task.swift
//  Molinar
//
//  Created by Matt Molinar on 2/25/23.
//

import Firebase
import CoreLocation


struct Task: Identifiable {
    let id: String
    let uid: String
    let title: String
    let coordinate: CLLocationCoordinate2D
    
    
    
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.title = dictionary["title"] as? String ?? ""
        self.coordinate = dictionary["coordinate"] as? CLLocationCoordinate2D ?? CLLocationCoordinate2D(latitude: 32.8226283, longitude: -96.8254078)
    }
}
