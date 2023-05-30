//
//  UploadTaskViewModel.swift
//  Molinar
//
//  Created by Matt Molinar on 2/25/23.
//

import Firebase
import SwiftUI
import CoreLocation

class UploadTaskViewModel: ObservableObject {
    func uploadTask(title: String, coordinate: CLLocationCoordinate2D, locationTitle: String, dueDate: Date, locationCreatedAt: CLLocationCoordinate2D) {
        guard let user = AuthViewModel.shared.user else { return }
        let docRef = COLLECTION_TASKS.document()
        
        
        var createdAt = Date()
        
        let data: [String: Any] = ["uid": user.id, "title": title, "id": docRef.documentID, "coordinate": [coordinate.latitude, coordinate.longitude], "locationTitle": locationTitle, "dueDate": dueDate, "completed": false, "locationCreatedAt": [locationCreatedAt.latitude, locationCreatedAt.longitude], "createdAt": createdAt]
        
        docRef.setData(data) { _ in
            print("DEBUG: Successfully uploaded task")
        }
    }
}
