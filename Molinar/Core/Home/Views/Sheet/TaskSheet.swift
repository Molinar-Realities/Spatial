//
//  TaskSheet.swift
//  Molinar
//
//  Created by Matt Molinar on 3/2/23.
//

import SwiftUI
import Dispatch

struct TaskSheet: View {
    @State private var taskTitle = ""
    @FocusState private var taskNameInFocus: Bool
    @State private var description = ""
    @Binding var showingSheet: Bool
    @State private var selectedDate = Date()
    @State var showDueDate = false
    @State var deadline = Date()
    @State var locationText = ""
    @Binding var presentationDetents: [PresentationDetent]
    @State var showLocationSearch = false
    @StateObject var viewModel = LocationSearchViewModel()

    
    var body: some View {
        VStack(spacing: 10) {
            
            if !showLocationSearch {
                TextField("Task Name", text: $taskTitle)
                    .focused($taskNameInFocus)
                    .textFieldStyle(.plain)
                    .padding(.horizontal)
                    .padding(.top)
                    .cornerRadius(10)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            print("DEBUG: Async ran.")
                            taskNameInFocus = true
                            print(taskNameInFocus)
                      }
                    }
                TextField("Where at?", text: $viewModel.queryFragment)
                    .textFieldStyle(.plain)
                    .padding(.horizontal)
                    .cornerRadius(10)
                    .onTapGesture {
                        print("location clicked")
                        withAnimation(.spring()) {
                            showLocationSearch = true
                            presentationDetents = [.large]
                            
                        }
                        
                    }
                
                Divider()
                HStack {
                    Button(action: {
                        showDueDate.toggle()
                    }) {
                        HStack {
                            Image(systemName: "calendar")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.green)
                            Text("Today")
                                .foregroundColor(.green)
                        }
                    }
                    Spacer()
                    Button(action: {
                        // Generate haptic feedback
                        let generator = UIImpactFeedbackGenerator(style: .light)
                        generator.prepare()
                        generator.impactOccurred()
                        showingSheet.toggle()
                    }) {
                        Image(systemName: "arrow.up.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 28, height: 28)
                            .padding(.horizontal)
                    }
                }
                .padding(.leading)

                Spacer()

            }
            if showLocationSearch {
                LocationSearchView(showLocationSearch: $showLocationSearch)
                
            }
                
                
            
            
//            TextField("Notes", text: $description)
//                .textFieldStyle(.plain)
//                .padding(.horizontal)
//                .cornerRadius(10)
            
        }
//        .frame(height: !showLocationSearch ? 140 : UIScreen.main.bounds.height)
        .popover(isPresented: $showDueDate) {
            ScheduleSheet(deadline: $deadline, showingSheet: $showDueDate)
                
                
        }
        
        
        
        
    }
}

struct TaskSheet_Previews: PreviewProvider {
    static var previews: some View {
        TaskSheet(showingSheet: .constant(true), presentationDetents: .constant([.medium]))
    }
}
