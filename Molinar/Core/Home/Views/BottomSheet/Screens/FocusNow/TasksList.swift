//
//  TasksList.swift
//  Molinar
//
//  Created by Matt Molinar on 3/6/23.
//

import SwiftUI

struct TasksList: View {
    @EnvironmentObject var viewModel: TasksViewModel
    var sortedTasks: [Task] {
        viewModel.userTasks.sorted { $0.dueDate < $1.dueDate }
    }
    var body: some View {
        VStack {
            ForEach(sortedTasks) { task in
                TaskCell(dueDate: task.dueDate, title: task.title, location: task.locationTitle)
                    .padding()
            }
        }
    }
}


struct TasksList_Previews: PreviewProvider {
    static var previews: some View {
        TasksList()
    }
}
