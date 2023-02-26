//
//  TasksViewModel.swift
//  Molinar
//
//  Created by Matt Molinar on 2/25/23.
//

import SwiftUI

class TasksViewModel: ObservableObject {
    @Published var tasks = [Task]()
    
    init() {
        fetchTasks()
    }
    
    
    func fetchTasks() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let query = COLLECTION_TASKS
        
        query.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges else { return }
            
            changes.forEach { change in
                let data = change.document.data()
                self.tasks.append(Task(dictionary: data))
            }
        }
    }
}
