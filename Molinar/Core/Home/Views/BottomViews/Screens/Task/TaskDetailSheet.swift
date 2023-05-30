//
//  TaskDetailSheet.swift
//  Molinar
//
//  Created by Matt Molinar on 3/7/23.
//

import SwiftUI

struct TaskDetailSheet: View {
    @State private var showOptions = false
    @Binding var isShowing: Bool
    @State var openEdit = false
    
    @State private var taskName: String = "Task Name"
    @State private var isEditingName: Bool = false
    
    func printStuff() {
        print("hello")
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    
                    Menu {
                        Button("Edit Task") {
                            // Set isEditingName to true when the "Edit Task" button is tapped
                            isEditingName = true
                        }
                        .foregroundColor(.blue) // Set the color of the "Edit Task" button to blue
                        
                        Button("Delete Task") {
                            // Action for menu item 2
                        }
                        .foregroundColor(.red) // Set the color of the "Delete Task" button to red
                    } label: {
                        Image(systemName: "ellipsis.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.gray)
                    }

                    
                    Button(action: {
                        // close the sheet
                        isShowing.toggle()
                    }) {
                        Image(systemName: "x.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.gray)
                    }
                }.padding()
                
                // Use a conditional statement to display either the task name or the text field
                if isEditingName {
                    TextField("Enter Task Name", text: $taskName, onCommit: {
                        // Set isEditingName to false when the user taps "Return"
                        isEditingName = false
                    })
                    .font(.subheadline)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                } else {
                    Text(taskName)
                        .font(.subheadline)
                }
                
                Divider()
                Text("Location")
                    .foregroundColor(.gray)
                    .font(.caption)
                Spacer()
            }
        }
    }
}


struct TaskDetailSheet_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailSheet(isShowing: .constant(true))
    }
}
