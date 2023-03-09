//
//  TaskFocusNow.swift
//  Molinar
//
//  Created by Matt Molinar on 3/6/23.
//

import SwiftUI

struct TaskFocusNow: View {
    @Binding var showAddTask: Bool
    @EnvironmentObject var tasksViewModel: TasksViewModel

    var body: some View {
      
        // Main VStack
//            VStack(alignment: .leading, spacing: 15) {
//                Text("Focus Now")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .padding(.horizontal)
                // Card slide shows
                    
                // Tasks from Calendar

//                VStack(alignment: .leading, spacing: 5) {
//                    // Header for Tasks from Calendar
//                    Text("Recommended")
//                        .font(.headline)
//                        .padding(.horizontal)
//
////                    // ScrollView for cards
////                    RecommendedTasks()
//                }
                

                // Your tasks, top projects
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 5) {
                    //Header
                        Text("Today's Agenda")
                            .foregroundColor(.black)
                            .font(.headline)
                            .padding(.leading)
                        .fontWeight(.bold)
//                        Image(systemName: "chevron.right")
//                            .foregroundColor(Color(.systemGray))
//                            .fontWeight(.bold)
                    }
                    TasksList(showAddTask: $showAddTask)
                    
                }
                
//            }
        
    }
}

//struct TaskFocusNow_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskFocusNow()
//    }
//}




