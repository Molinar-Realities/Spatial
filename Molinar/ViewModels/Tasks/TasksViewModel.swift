//
//  TasksViewModel.swift
//  Molinar
//
//  Created by Matt Molinar on 2/25/23.
//

import SwiftUI

struct TasksViewModel: View {
    @Published var tasks = [Task]()
    var body: some View {
        Text("hi")
    }
}

struct TasksViewModel_Previews: PreviewProvider {
    static var previews: some View {
        TasksViewModel()
    }
}
