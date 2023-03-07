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
    
    
    
    
    func fetchUserTasks() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("tasks").whereField("uid", isEqualTo: uid).addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges else { return }
            
            changes.forEach { change in
                let data = change.document.data()
                let taskId = data["id"] as! String
                let taskIndex = self.userTasks.firstIndex(where: { $0.id == taskId })
                
                // Not sure why task already exists.
                if let index = taskIndex {
                    print("DEBUG: Task already exists.")
                } else {
                    // Add new task
                    var data = change.document.data()
                    let timestamp = data["dueDate"] as! Timestamp
                    var date = timestamp.dateValue()
                    data["dueDate"] = date
                    self.userTasks.append(Task(dictionary: data))
                }
            }
            
        }
    }

}
