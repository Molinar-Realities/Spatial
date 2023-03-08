//
//  Constants.swift
//  Molinar
//
//  Created by Matt Molinar on 2/25/23.
//

import Firebase


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

extension Date {
    func formattedString(dateStyle: DateFormatter.Style = .short, timeStyle: DateFormatter.Style = .short) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter.string(from: self)
    }
}





