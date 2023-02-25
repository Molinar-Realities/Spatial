//
//  User.swift
//  Molinar
//
//  Created by Matt Molinar on 2/24/23.
//

import Firebase

struct User: Identifiable {
    let id: String
    var username: String
    var profileImageUrl: String
    var fullname: String
    var email: String
    var bio: String
    var stats: UserStats
    
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.bio = dictionary["bio"] as? String ?? ""
        self.stats = UserStats(followers: 0, following: 0)
    }
}


struct UserStats {
    var followers: Int
    var following: Int
}

