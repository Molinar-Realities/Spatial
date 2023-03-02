//
//  BigCalendar.swift
//  Molinar
//
//  Created by Matt Molinar on 3/2/23.
//

import SwiftUI
import Foundation

struct BigCalendar: View {
    
    
    var body: some View {
        
        let weekdays = ["S", "M", "T", "W", "T", "F", "S"]

        
        
        VStack(spacing: 30) {
            // header
            HStack {
                Spacer()
                Button(action: {}) {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.red)
                }
            }.padding(.horizontal)
            
            // Sun-Sat
            HStack(spacing: 35) {
                ForEach(0 ..< 7) { item in
                    VStack(spacing: 30) {
                        Text(weekdays[item])
                        Text("26")
                    }
                }
            }
            
            Divider()
            
        }
    }
}

struct BigCalendar_Previews: PreviewProvider {
    static var previews: some View {
        BigCalendar()
    }
}
