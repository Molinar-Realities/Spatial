//
//  AddTask.swift
//  Molinar
//
//  Created by Matt Molinar on 2/13/23.
//

import SwiftUI

struct AddTaskSheet: View {
    @ObservedObject var viewModel: UploadTaskViewModel
    @State var taskName = ""
    @State var taskDuration = 0
    @State var priority = ""
    @State private var deadline = Date()
    @State var deadlineType = 1
    @State private var startDate = Date()
    @Binding var showAddTaskSheet: Bool
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2023, month: 2, day: 13)
        let endComponents = DateComponents(year: 2025, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    
    func convertToSeconds(_ durationString: String) -> Int? {
        let parts = durationString.split(separator: " ")
        guard parts.count == 2 else { return nil }
        let value = Int(parts[0])
        let unit = parts[1]
        switch unit {
        case "sec", "secs", "second", "seconds":
            return value
        case "min", "mins", "minute", "minutes":
            return value! * 60
        case "hour", "hours":
            return value! * 3600
        default:
            return nil
        }
    }


    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    showAddTaskSheet.toggle()
                }) {
                    Image(systemName: "x.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.gray)
                }
                Spacer()
            }.padding(.horizontal)
            Image("MolinarLogo")
            VStack {
                TextField("Enter task name", text: $taskName)
                Divider()
                
                TextField("Enter duration", text: Binding(
                    get: {
                        let minutes = taskDuration / 60
                        if minutes < 60 {
                            return "\(minutes) min"
                        } else {
                            return "\(minutes / 60) hr \(minutes % 60) min"
                        }
                    },
                    set: { newValue in
                        if let seconds = convertToSeconds(newValue) {
                            taskDuration = seconds
                        }
                    }
                ))


                Divider()
                
                PickerSectionView(
                    selection: Binding(
                        get: {
                            switch priority {
                            case "Low":
                                return 0
                            case "Medium":
                                return 1
                            case "High":
                                return 2
                            default:
                                return 3
                            }
                        },
                        set: {
                            switch $0 {
                            case 0:
                                priority = "Low"
                            case 1:
                                priority = "Medium"
                            case 2:
                                priority = "High"
                            default:
                                priority = "None"
                            }
                        }
                    ),
                    pickerName: "Priority",
                    pickerOptions: ["Low", "Medium", "High", "None"]
                )

                
                HStack {
                    DatePicker(
                            "Deadline",
                             selection: $deadline,
                             in: dateRange,
                             displayedComponents: [.date, .hourAndMinute]
                        )
                }
                
                Divider()
                
                PickerSectionView(selection: $deadlineType, pickerName: "Deadline Type", pickerOptions: ["Soft", "Hard", "None"])
                
            }
            .padding(.horizontal, 50)
            VStack {
                HStack {
                    DatePicker(
                            "Starting",
                             selection: $startDate,
                             in: dateRange,
                             displayedComponents: [.date, .hourAndMinute]
                        )
                }
                
                Divider()
                
                LocationHeader(headerText: "Location")
//                MapboxRepresentable().environmentObject(MapboxViewModel())
//                    .cornerRadius(22)
                
                HStack {
                    Spacer()
                    InboxIcon()
                    Spacer()
                    Button(action: {
                        viewModel.uploadTask(title: taskName, description: "", priority: priority, duration: taskDuration)
                        showAddTaskSheet.toggle()
                    }) {
                        Text("Schedule")
                            .frame(width: 115, height: 50)
                    }
                    .foregroundColor(.white)
                    .background(.black)
                    
                    .cornerRadius(14)
                    
                    Spacer()
                }.padding(.vertical)
                        
                    
                
            }
            .padding(.horizontal, 50)
            .padding(.vertical, 16)
 
        }

    }
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskSheet( viewModel: UploadTaskViewModel(), showAddTaskSheet: .constant(false))
    }
}





