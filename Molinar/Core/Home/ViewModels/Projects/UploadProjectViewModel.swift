//
//  UploadProjectViewModel.swift
//  Molinar
//
//  Created by Matt Molinar on 3/11/23.
//

import Firebase
import SwiftUI
import CoreLocation

class UploadProjectViewModel: ObservableObject {
    func uploadProject(title: String, createdAt: Date, locationCreatedAt: CLLocationCoordinate2D) {
        guard let user = AuthViewModel.shared.user else {
            return
        }
        let docRef = COLLECTION_PROJECTS.document()
        
        var createdAt = Date()
        
        let data: [String: Any] = ["uid": user.id, "title": title, "id": docRef.documentID, "createdAt": createdAt, "locationCreatedAt": [locationCreatedAt.latitude, locationCreatedAt.longitude]]
        
        docRef.setData(data) { _ in
            print("DEBUG: Successfully uploaded project.")
        }
        
        
    }
}
