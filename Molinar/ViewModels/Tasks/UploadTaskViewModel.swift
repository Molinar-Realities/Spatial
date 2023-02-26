//
//  UploadTaskViewModel.swift
//  Molinar
//
//  Created by Matt Molinar on 2/25/23.
//

import Firebase
import SwiftUI

class UploadTaskViewModel: ObservableObject {
    func uploadTask(title: String, description: String, priority: String, duration: Int) {
        guard let user = AuthViewModel.shared.user else { return }
        let docRef = COLLECTION_TASKS.document()
        
        let data: [String: Any] = ["uid": user.id, "title": title, "fullname": user.fullname, "username": user.username, "id": docRef.documentID, "description": description, "duration": duration, "priority": priority]
        
        docRef.setData(data) { _ in
            print("DEBUG: Successfully uploaded task")
        }
    }
}
