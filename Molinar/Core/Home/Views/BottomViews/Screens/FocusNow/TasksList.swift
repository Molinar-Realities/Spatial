//
//  TasksList.swift
//  Molinar
//
//  Created by Matt Molinar on 3/6/23.
//

import SwiftUI

struct TasksList: View {
    @State var presentTaskDetail = false
    @EnvironmentObject var viewModel: TasksViewModel
    @State var selectedTask: Task = Task(dictionary: ["": ""])
    var sortedTasks: [Task] {
        return viewModel.userTasks
            .filter { $0.dueDate != nil && Calendar.current.isDateInToday($0.dueDate!) } // Safely unwrap dueDate using force unwrap with nil check
            .sorted { $0.dueDate! < $1.dueDate! } // Safely unwrap dueDate using force unwrap with nil check
    }

    var body: some View {
        Group {
            if !viewModel.isLoading && !sortedTasks.isEmpty {
                VStack {
                    ForEach(sortedTasks) { task in
                        TaskCell(completed: task.completed, dueDate: task.dueDate ?? Date(), title: task.title, location: task.locationTitle, id: task.id)
                            .padding()
                            .onTapGesture {
                                selectedTask = task
                                // Generate haptic feedback
                                let generator = UIImpactFeedbackGenerator(style: .light)
                                generator.prepare()
                                generator.impactOccurred()
                                presentTaskDetail.toggle()
                            }
                    }
                }
            } else {
                ProgressView()
            }
        }
//        .sheet(isPresented: $presentTaskDetail) {
//            TaskDetailSheet(isShowing: $presentTaskDetail)
//                .presentationDetents([.medium])
//        }
    }
}



//struct TasksList_Previews: PreviewProvider {
//    static var previews: some View {
//        TasksList().environmentObject(TasksViewModel())
//    }
//}



