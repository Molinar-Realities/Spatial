//
//  AddTask.swift
//  Molinar
//
//  Created by Matt Molinar on 2/13/23.
//

import SwiftUI

struct AddTaskSheet: View {
    @State var taskName = ""
    @State var taskDuration = ""
    @State var priority = 1
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
                TextField("Enter duration",
                          text: $taskDuration)
                Divider()
                
                PickerSectionView(selection: $priority, pickerName: "Priority", pickerOptions: ["Low", "Medium", "High", "None"])
                
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
                MapboxRepresentable().environmentObject(MapboxViewModel())
                    .cornerRadius(22)
                
                HStack {
                    Spacer()
                    InboxIcon()
                    Spacer()
                    Button(action: {
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
        AddTaskSheet( showAddTaskSheet: .constant(false))
    }
}





