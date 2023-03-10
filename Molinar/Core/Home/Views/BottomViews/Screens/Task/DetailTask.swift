//
//  DetailTask.swift
//  Molinar
//
//  Created by Matt Molinar on 3/9/23.
//

import SwiftUI

struct DetailTask: View {
    @EnvironmentObject var viewModel: TasksViewModel
    
    // Returns the color of the deadline text based on its proximity to today's date
        func getDeadlineColor() -> Color {
            let calendar = Calendar.current
            if calendar.isDateInToday(viewModel.selectedTask.dueDate!) {
                return .green
            } else if calendar.isDateInTomorrow(viewModel.selectedTask.dueDate!) {
                return .yellow
            } else if calendar.isDate(viewModel.selectedTask.dueDate!, equalTo: Date(), toGranularity: .weekOfYear) {
                return .purple // Replace with your own color for this week's deadlines
            } else {
                return .gray // Replace with your own color for deadlines beyond this week
            }
        }
    
    // Returns the text of the deadline based on its proximity to today's date
        func getDeadlineText() -> String {
            let calendar = Calendar.current
            if calendar.isDateInToday(viewModel.selectedTask.dueDate!) {
                return "Today"
            } else if calendar.isDateInTomorrow(viewModel.selectedTask.dueDate!) {
                return "Tomorrow"
            } else if calendar.isDate(viewModel.selectedTask.dueDate!, equalTo: Date(), toGranularity: .weekOfYear) {
                let formatter = DateFormatter()
                formatter.dateFormat = "EEE" // Use "EEE" for abbreviated day names like "Mon", "Tue", etc.
                return formatter.string(from: viewModel.selectedTask.dueDate!)
            } else {
                let formatter = DateFormatter()
                formatter.dateFormat = "MMM d" // Use "MMM d" for abbreviated month name and day number like "Mar 30"
                return formatter.string(from: viewModel.selectedTask.dueDate!)
            }
        }

    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(spacing: 10) {
                Image(systemName: "mappin.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.gray)
                Text(viewModel.selectedTask.locationTitle)
                    .foregroundColor(.gray)
                Spacer()
                    
            }.padding(.horizontal)
            Divider()
            HStack(spacing: 10){
                Image(systemName: "calendar")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.green)
                Text(getDeadlineText())
                    .foregroundColor(getDeadlineColor())
            }.padding(.horizontal)
            
            Divider()
//            HStack {
//                Spacer()
//                Button(action: {}) {
//                    VStack {
//                        Image(systemName:"play.circle.fill")
//                            .resizable()
//                            .scaledToFill()
//                        .frame(width: 64, height: 64)
//                        Text("Focus Now")
//                    }
//                }
//                .disabled(true)
//                Spacer()
//            }.padding(.top, 16)
            
            
        }.padding(.top)
    }
}

struct DetailTask_Previews: PreviewProvider {
    static var previews: some View {
        DetailTask()
    }
}
