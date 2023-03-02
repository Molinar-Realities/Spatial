//
//  ProfileViewModel.swift
//  Molinar
//
//  Created by Matt Molinar on 12/2/22.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    let user: User
    @Published var userTasks = [Task]()
    
    init(user: User) {
        self.user = user
        fetchUserTasks()
        
    }
    
    func fetchUserTasks() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("tasks").whereField("uid", isEqualTo: uid).addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges else { return }
            
            changes.forEach { change in
                let data = change.document.data()
                self.userTasks.append(Task(dictionary: data))
            }
            
        }
    }
}


