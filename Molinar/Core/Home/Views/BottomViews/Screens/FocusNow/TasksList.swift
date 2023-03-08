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
        print(viewModel.userTasks)
        return viewModel.userTasks
            .filter { Calendar.current.isDateInToday($0.dueDate) }
            .sorted { $0.dueDate < $1.dueDate }
    }

    var body: some View {
        VStack {
            ForEach(sortedTasks) { task in
                TaskCell(dueDate: task.dueDate, title: task.title, location: task.locationTitle)
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
//        .sheet(isPresented: $presentTaskDetail) {
//            TaskDetailSheet(isShowing: $presentTaskDetail)
//                .presentationDetents([.medium])
//        }
    }
}


struct TasksList_Previews: PreviewProvider {
    static var previews: some View {
        TasksList().environmentObject(TasksViewModel())
    }
}
