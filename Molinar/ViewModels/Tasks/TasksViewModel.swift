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
        COLLECTION_TASKS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.tasks = documents.map({ Task(dictionary: $0.data())})
        }
    }
}
