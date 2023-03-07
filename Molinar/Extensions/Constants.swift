//
//  Constants.swift
//  Molinar
//
//  Created by Matt Molinar on 2/25/23.
//

import Firebase

let COLLECTION_TASKS = Firestore.firestore().collection("tasks")


extension Date {
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    func toString(dateFormat: String) -> String {
        print(self)
            let formatter = DateFormatter()
            formatter.dateFormat = dateFormat
            return formatter.string(from: self)
        }

}



