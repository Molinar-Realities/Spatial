//
//  Event.swift
//  Molinar
//
//  Created by Matt Molinar on 5/30/23.
//

import Foundation
import CoreLocation

struct Event: Identifiable {
    let id: String
    let creatorUuid: String
    let name: String
    let description: String
    let location_title: String
    let coordinate: CLLocationCoordinate2D
    let timeStart: Date
    let timeEnd: Date
    let createdAt: Date
    let hang_id: String
    let isPublic: Bool
    let creatorUser: User
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.creatorUuid = dictionary["creatorUuid"] as? String ?? ""
        self.name = dictionary["name"] as? String ?? ""
        self.description = dictionary["description"] as? String ?? ""
        self.location_title = dictionary["location_title"] as? String ?? ""
        
        // Parse and set the coordinate
        if let latitude = dictionary["latitude"] as? CLLocationDegrees,
           let longitude = dictionary["longitude"] as? CLLocationDegrees {
            self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        } else {
            self.coordinate = CLLocationCoordinate2D()
        }
        
        // Parse and set the timeStart
        if let timeStartTimestamp = dictionary["timeStart"] as? TimeInterval {
            self.timeStart = Date(timeIntervalSince1970: timeStartTimestamp)
        } else {
            self.timeStart = Date()
        }
        
        // Parse and set the timeEnd
        if let timeEndTimestamp = dictionary["timeEnd"] as? TimeInterval {
            self.timeEnd = Date(timeIntervalSince1970: timeEndTimestamp)
        } else {
            self.timeEnd = Date()
        }
        
        self.createdAt = dictionary["createdAt"] as? Date ?? Date()
        self.hang_id = dictionary["hang_id"] as? String ?? ""
        self.isPublic = dictionary["isPublic"] as? Bool ?? false
        self.creatorUser = User(dictionary: dictionary["creatorUser"] as? [String: Any] ?? [:])
    }

}
