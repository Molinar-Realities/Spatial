//
//  Item.swift
//  Molinar
//
//  Created by Matt Molinar on 3/2/23.
//

import Foundation


struct Item: Identifiable {
    let id: String
    let uid: String
    let username: String
    let fullname: String
    let description: String
    let title: String
    let itemPictureUrl: String
   

    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.description = dictionary["description"] as? String ?? ""
        self.title = dictionary["title"] as? String ?? ""
        self.itemPictureUrl = dictionary["itemPictureUrl"] as? String ?? ""
    }
}
