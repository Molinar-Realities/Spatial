//
//  DetailTaskHeader.swift
//  Molinar
//
//  Created by Matt Molinar on 3/9/23.
//

import SwiftUI

struct DetailTaskHeader: View {
    @Binding var showTabs: Bool
    @State var openEdit = false
    @Binding var showTaskDetail: Bool
    @EnvironmentObject var viewModel: TasksViewModel


    var body: some View {
        HStack {
            Text(viewModel.selectedTask.title)
                .foregroundColor(.black)
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
//            Menu {
//                Button("Edit Task") {
//                    // Set isEditingName to true when the "Edit Task" button is tapped
////                    isEditingName = true
//                }
//                .foregroundColor(.blue) // Set the color of the "Edit Task" button to blue
//                
//                Button("Delete Task") {
//                    // Action for menu item 2
//                }
//                .foregroundColor(.red) // Set the color of the "Delete Task" button to red
//            } label: {
//                Image(systemName: "ellipsis.circle.fill")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 24, height: 24)
//                    .foregroundColor(.gray)
//            }
            
            Button(action: {
                // close the sheet
                showTaskDetail.toggle()
                showTabs.toggle()
            }) {
                Image(systemName: "x.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.gray)
            }
            
        }.padding(.horizontal)
    }
}

struct DetailTaskHeader_Previews: PreviewProvider {
    static var previews: some View {
        DetailTaskHeader(showTabs: .constant(true), showTaskDetail: .constant(true))
    }
}
