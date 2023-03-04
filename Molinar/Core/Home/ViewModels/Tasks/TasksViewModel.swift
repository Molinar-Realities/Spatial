//
//  TasksViewModel.swift
//  Molinar
//
//  Created by Matt Molinar on 2/25/23.
//

import SwiftUI
import Firebase 

class TasksViewModel: ObservableObject {
    @Published var userTasks = [Task]()
    
    init() {
        fetchUserTasks()
    }
    
    
    func fetchTasks() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let query = COLLECTION_TASKS
        
        query.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges else { return }
            
            changes.forEach { change in
                let data = change.document.data()
                self.userTasks.append(Task(dictionary: data))
            }
        }
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
