//
//  TaskFocusNow.swift
//  Molinar
//
//  Created by Matt Molinar on 3/6/23.
//

import SwiftUI
import BottomSheet

struct TaskFocusNow: View {
    @Binding var bottomSheetPosition: BottomSheetPosition
    @Binding var showTaskDetail: Bool
    @Binding var showAddTask: Bool
    @EnvironmentObject var tasksViewModel: TasksViewModel
    @Binding var showTabs: Bool
    @Binding var selectedFilter: TaskFilterOptions
    @State var showAddProject = false
    @EnvironmentObject var projectsViewModel: ProjectsViewModel

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
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            TaskFilterButtons(selectedOption: $selectedFilter)
                        }
                    }
                    .padding(.top)
                    
                    if selectedFilter == .today {
                        VStack(alignment: .leading) {
                            Text("Your Moves Today")
                                .foregroundColor(.black)
                                .font(.headline)
                                .padding(.leading)
                                .fontWeight(.bold)
                                .padding(.top)
                            TasksList(selectedFilter: $selectedFilter, bottomSheetPosition: $bottomSheetPosition, showTabs: $showTabs, showTaskDetail: $showTaskDetail, showAddTask: $showAddTask)
                            
                        }
                        
                    } else if selectedFilter == .upcoming {
                        VStack(alignment: .leading) {
                            Text("Upcoming Moves")
                                .foregroundColor(.black)
                                .font(.headline)
                                .padding(.leading)
                                .fontWeight(.bold)
                            InboxView()
                            Spacer()
                        }.padding(.horizontal)
                        
                    } else if selectedFilter == .projects {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Projects")
                                    .foregroundColor(.black)
                                    .font(.headline)
                                    .padding(.leading)
                                    .fontWeight(.bold)
                                Button(action: {
                                    showAddProject.toggle()
                                }) {
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 18, height: 18)
                                        .foregroundColor(.gray)
                                }
                            }.padding(.vertical)
                            ProjectsList()
                            Spacer()

                        }.padding(.horizontal)
                        
                    } else if selectedFilter == .inbox {
                        VStack(alignment: .leading) {
                            Text("Upcoming Moves")
                                .foregroundColor(.black)
                                .font(.headline)
                                .padding(.leading)
                                .fontWeight(.bold)
                            InboxView()
                            Spacer()
                        }.padding(.horizontal)
                    }
                        

                    
            
                    
                    
                }
                .sheet(isPresented: $showAddProject) {
                    NewProject()
                }
//            }
        
    }
}

//struct TaskFocusNow_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskFocusNow()
//    }
//}




