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
    func uploadTask(title: String, coordinate: CLLocationCoordinate2D, locationTitle: String) {
        guard let user = AuthViewModel.shared.user else { return }
        let docRef = COLLECTION_TASKS.document()
        print("DEBUG: from within upload task locationTitle: \(locationTitle)")
        
        let data: [String: Any] = ["uid": user.id, "title": title, "id": docRef.documentID, "coordinate": [coordinate.latitude, coordinate.longitude], "locationTitle": locationTitle]
        
        docRef.setData(data) { _ in
            print("DEBUG: Successfully uploaded task")
        }
    }
}
