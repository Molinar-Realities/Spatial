//
//  TasksList.swift
//  Molinar
//
//  Created by Matt Molinar on 3/6/23.
//

import SwiftUI

struct TasksList: View {
    @StateObject var viewModel = TasksViewModel()
    var body: some View {
        VStack {
            ForEach(viewModel.userTasks) { task in
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
