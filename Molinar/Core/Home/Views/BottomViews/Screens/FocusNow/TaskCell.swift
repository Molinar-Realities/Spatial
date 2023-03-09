//
//  TaskCell.swift
//  Molinar
//
//  Created by Matt Molinar on 3/6/23.
//

import SwiftUI
import Dispatch
import Firebase

struct TaskCell: View {
    @State private var isAnimatingCheckmark = false
    @State var removed = false
    var completed: Bool
    @State var copyCompleted: Bool
    var dueDate: Date
    var title: String
    var location: String
    var id: String
    
    init(completed: Bool, dueDate: Date, title: String, location: String, id: String) {
            self.completed = completed
            self.dueDate = dueDate
            self.title = title
            self.location = location
            self.id = id
            self._copyCompleted = State(initialValue: completed)
        }


    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    let impact = UIImpactFeedbackGenerator(style: .medium)
                    impact.impactOccurred()
                    withAnimation {
                        copyCompleted.toggle()
                        self.isAnimatingCheckmark = true
                    }
                        Firestore.firestore().collection("tasks").document(id).updateData([
                            "completed": copyCompleted
                        ]) { error in
                            if let error = error {
                                print("Error updating task: \(error.localizedDescription)")
                            }
                        }
                    
                            }) {
                                Image(systemName: copyCompleted ? "checkmark.circle.fill" : "circle")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(copyCompleted ? .green : .black)
                                    .rotationEffect(Angle(degrees: self.isAnimatingCheckmark ? 360 : 0))
                                    .animation(.easeInOut(duration: 0.3))
                                    .onAppear {
                                        self.isAnimatingCheckmark = false
                                    }
                            }
//                            .opacity(completed ? 0.5 : 1)
                            .animation(.easeInOut(duration: 0.3))
                VStack(alignment: .leading) {
                    Text(title)
                        .foregroundColor(.black)
                        .strikethrough(copyCompleted ? true : false)

                        .opacity(copyCompleted ? 0.5 : 1)
                    .animation(.easeInOut(duration: 0.3))
                    Text(location)
                        .foregroundColor(.gray)
                        .strikethrough(copyCompleted ? true : false)

                }
                Spacer()
                Text(dueDate.isToday ? dueDate.toString(dateFormat: "h:mm a") : dueDate.toString(dateFormat: "MMM d"))
                    .foregroundColor(.gray)
                    .opacity(copyCompleted ? 0.5 : 1)
                    .strikethrough(copyCompleted ? true : false)
                    .animation(.easeInOut(duration: 0.3))
            }
            Divider()
        }
    }
}

//struct TaskCell_Previews: PreviewProvider {
//    static var previews: some View {
//        T
//    }
//}
