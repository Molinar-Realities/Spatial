//
//  TaskSheet.swift
//  Molinar
//
//  Created by Matt Molinar on 3/2/23.
//

import SwiftUI
import Dispatch
import CoreLocation

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
    @EnvironmentObject var viewModel: LocationSearchViewModel
    @StateObject var taskUpload = UploadTaskViewModel()
    @StateObject var locationManager = LocationManager()


    
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
                        taskUpload.uploadTask(title: taskTitle, coordinate: viewModel.selectedLocationCoordinate ?? CLLocationCoordinate2D(latitude: 32.8226283, longitude: -96.8254078), locationTitle: viewModel.selectedLocationTitle ?? "Unknown Location", dueDate: deadline, locationCreatedAt: locationManager.currentLocation?.coordinate ?? CLLocationCoordinate2D(latitude: 0.00, longitude: 0.00))
                        viewModel.queryFragment = ""
                        showingSheet.toggle()
                    }) {
                        Image(systemName: "arrow.up.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 28, height: 28)
                            .padding(.horizontal)
                    }
                    .disabled(taskTitle.isEmpty)
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


