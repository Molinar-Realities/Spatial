//
//  TaskFocusNow.swift
//  Molinar
//
//  Created by Matt Molinar on 3/6/23.
//

import SwiftUI
import BottomSheet

struct MovesView: View {
    @Binding var bottomSheetPosition: BottomSheetPosition
    @Binding var showTaskDetail: Bool
    @Binding var showAddTask: Bool
    @EnvironmentObject var tasksViewModel: TasksViewModel
    @Binding var showTabs: Bool
    @Binding var selectedFilter: TaskFilterOptions
    @State var showAddProject = false
    @EnvironmentObject var projectsViewModel: ProjectsViewModel

    var body: some View {
                VStack(alignment: .leading, spacing: 10) {
 
                    if selectedFilter == .today {
                        VStack(alignment: .leading) {
                            MovesList(selectedFilter: $selectedFilter, bottomSheetPosition: $bottomSheetPosition, showTabs: $showTabs, showTaskDetail: $showTaskDetail, showAddTask: $showAddTask)
                            
                        }
 
                    }
                
                }
    }
}

//struct TaskFocusNow_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskFocusNow()
//    }
//}




