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
    @Published var isLoading = false
    
    init() {
        fetchUserTasks()
    }
    

    
    func fetchUserTasks() {
        isLoading = true
        
        guard let uid = AuthViewModel.shared.userSession?.uid else {
            isLoading = false
            return
        }
        print("DEBUG: uid \(uid)")
        
        Firestore.firestore().collection("tasks").whereField("uid", isEqualTo: uid).addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges else {
                self.isLoading = false
                return
            }
            
            changes.forEach { change in
                let data = change.document.data()
                let taskId = data["id"] as! String
                let taskIndex = self.userTasks.firstIndex(where: { $0.id == taskId })
                
                if let index = taskIndex {
                    print("DEBUG: Task already exists.")
                } else {
                    var data = change.document.data()
                    if let dueDate = data["dueDate"] as? Timestamp {
                        // Use dueDate variable here
                        var date = dueDate.dateValue()
                        data["dueDate"] = date

                    } else {
                        // Handle case where data["dueDate"] is nil or not a Timestamp type
                        print("DEBUG: dueDate was nil or not timestamp")
                    }
                    self.userTasks.append(Task(dictionary: data))
                }
            }
            
            self.isLoading = false
        }
    }
}
