//
//  Task.swift
//  Molinar
//
//  Created by Matt Molinar on 2/25/23.
//

import Firebase


struct Task: Identifiable {
    let id: String
    let uid: String
    let username: String
    let fullname: String
    let description: String
    let title: String
    
    
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.description = dictionary["description"] as? String ?? ""
        self.title = dictionary["title"] as? String ?? ""
    }
}
