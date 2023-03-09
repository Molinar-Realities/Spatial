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
                        TaskCell(dueDate: task.dueDate ?? Date(), title: task.title, location: task.locationTitle)
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


struct Spinner: View {
    @State private var isAnimating = false
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<6) { index in
                Group {
                    Circle()
                        .frame(width: geometry.size.width / 10, height: geometry.size.height / 5)
                        .scaleEffect(!isAnimating ? 1 - CGFloat(index) / 5 : 0.2 + CGFloat(index) / 5)
                        .offset(y: geometry.size.width / 10 - geometry.size.height / 2)
                }
                .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                .rotationEffect(!isAnimating ? .degrees(0) : .degrees(360))
                .animation(Animation.timingCurve(0.5, 0.15 + Double(index) / 10, 0.25, 1.0, duration: 1.5).repeatForever(autoreverses: false))
            }
            .aspectRatio(1, contentMode: .fit)
            .onAppear {
                isAnimating = true
            }
            .onDisappear {
                isAnimating = false
            }
        }
    }
}
