//
//  TasksList.swift
//  Molinar
//
//  Created by Matt Molinar on 3/6/23.
//

import SwiftUI

struct TasksList: View {
    var body: some View {
        VStack {
            ForEach(0..<10) { _ in
                TaskCell()
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
