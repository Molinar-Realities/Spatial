//
//  Project.swift
//  Molinar
//
//  Created by Matt Molinar on 3/11/23.
//

import Foundation
import CoreLocation


struct Project: Identifiable {
    var id: String
    var uid: String
    var title: String
    var locationCreatedAt: CLLocationCoordinate2D
    var createdAt: Date
    
    
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.title = dictionary["title"] as? String ?? ""
        self.locationCreatedAt = dictionary["locationCreatedAt"] as? CLLocationCoordinate2D ?? CLLocationCoordinate2D(latitude: 32.8226283, longitude: -96.8254078)
        self.createdAt = dictionary["createdAt"] as? Date ?? Date()
        
    }
}
