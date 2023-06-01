//
//  TasksList.swift
//  Molinar
//
//  Created by Matt Molinar on 3/6/23.
//

import SwiftUI
import BottomSheet

struct MovesList: View {
    @Binding var selectedFilter: TaskFilterOptions
    @Binding var bottomSheetPosition: BottomSheetPosition
    @Binding var showTabs: Bool
    @Binding var showTaskDetail: Bool
    @Binding var showAddTask: Bool
    @State var presentTaskDetail = false
    @EnvironmentObject var viewModel: TasksViewModel
    var sortedTasks: [Task] {
        return viewModel.userTasks
            .filter { $0.dueDate != nil && Calendar.current.isDateInToday($0.dueDate!) } // Safely unwrap dueDate using force unwrap with nil check
            .sorted { $0.dueDate! < $1.dueDate! } // Safely unwrap dueDate using force unwrap with nil check
    }

    var body: some View {
        Group {
            if !viewModel.isLoading && !sortedTasks.isEmpty {
                VStack(spacing: 0) {
                    ForEach(sortedTasks) { task in
                        TaskCell(completed: task.completed, dueDate: task.dueDate ?? Date(), title: task.title, location: task.locationTitle, id: task.id)
                            .padding()
                            .onTapGesture {
                                // Generate haptic feedback
                                viewModel.selectedTask = task
                                let generator = UIImpactFeedbackGenerator(style: .light)
                                generator.prepare()
                                generator.impactOccurred()
                                bottomSheetPosition = .relative(0.4)
                                presentTaskDetail.toggle()
                                showTaskDetail.toggle()
                                showTabs.toggle()
                            }
                    }
                }
            } else {
                
                VStack {
                    if viewModel.isLoading {
                        ProgressView()
                    } else {
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 15) {
                                HStack {
                                    Spacer()
                                    Text("No Moves today!")
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                                Button(action: {
                                    // Generate haptic feedback
                                    let generator = UIImpactFeedbackGenerator(style: .light)
                                    generator.prepare()
                                    generator.impactOccurred()
                                    showAddTask.toggle()
                                }) {
                                    HStack {
                                        Spacer()
                                        Text("Tap")
                                            .foregroundColor(.gray)
                                            .font(.caption)
                                        Image(systemName: "plus.app.fill")
                                            .foregroundColor(.gray)
                                        Text("to add a Move.")
                                            .foregroundColor(.gray)
                                            .font(.caption)
                                        Spacer()
                                    }
                                }
                                Spacer()
                            }
                            Spacer()
                        }
                        .padding()
                    }
                }
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



