//
//  ProjectsViewModel.swift
//  Molinar
//
//  Created by Matt Molinar on 3/11/23.
//

import SwiftUI
import Firebase
import CoreLocation
import Combine

class ProjectsViewModel: ObservableObject {
    @Published var userProjects = [Project]()
    @Published var isLoading = false
    @Published var selectedProject: Project = Project(dictionary: ["": ""])
    
    init() {
        fetchUserProjects()
    }
    
    
    func fetchUserProjects() {
        isLoading = true
        
        guard let uid = AuthViewModel.shared.userSession?.uid else {
            isLoading = false

            return
        }
        print("DEBUG: uid \(uid)")
        
        Firestore.firestore().collection("tasks")
            .whereField("uid", isEqualTo: uid).addSnapshotListener { snapshot, error in
                guard let changes = snapshot?.documentChanges else {
                    self.isLoading = false
                    
                    return
                }
                
                changes.forEach { change in
                    let data = change.document.data()
                    let projectId = data["id"] as! String
                    let projectIndex = self.userProjects.firstIndex(where: { $0.id == projectId })
                    
                    if let index = projectIndex {
                        print("DEBUG: Project already exists")
                    } else {
                        var data = change.document.data()
                        self.userProjects.append(Project(dictionary: data))
                    }
                }
                self.isLoading = false
            }
        
    }
    
    
}
