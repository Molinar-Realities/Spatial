//
//  TaskCell.swift
//  Molinar
//
//  Created by Matt Molinar on 2/11/23.
//

import SwiftUI

struct TaskCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                Image(systemName: "dumbbell.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 18, height: 18)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Task title")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)
                        
                        Text("project name")
                            .foregroundColor(.gray)
                        
                    }
                    Text("Task description lol")
                        .foregroundColor(.gray)
                }
            }
            .padding(.bottom)
            .padding(.trailing)
            Divider()
        }
        .padding(.horizontal)
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell()
    }
}
