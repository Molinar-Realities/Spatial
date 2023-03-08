//
//  TaskCell.swift
//  Molinar
//
//  Created by Matt Molinar on 3/6/23.
//

import SwiftUI
import Dispatch

struct TaskCell: View {
    @State private var isAnimatingCheckmark = false
    @State var removed = false
    @State var completed = false
    var dueDate: Date
    var title: String
    var location: String
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    let impact = UIImpactFeedbackGenerator(style: .medium)
                    impact.impactOccurred()
                    
                    
                                withAnimation {
                                    completed.toggle()
                                    self.isAnimatingCheckmark = true
                                }
                            }) {
                                Image(systemName: completed ? "checkmark.circle.fill" : "circle")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(completed ? .green : .primary)
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
                        .strikethrough(completed ? true : false)

                        .opacity(completed ? 0.5 : 1)
                    .animation(.easeInOut(duration: 0.3))
                    Text(location)
                        .foregroundColor(.gray)
                        .strikethrough(completed ? true : false)

                }
                Spacer()
                Text(dueDate.isToday ? dueDate.toString(dateFormat: "h:mm a") : dueDate.toString(dateFormat: "MMM d"))
                    .opacity(completed ? 0.5 : 1)
                    .strikethrough(completed ? true : false)
                    .animation(.easeInOut(duration: 0.3))
            }
            Divider()
        }
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(dueDate: Date(), title: "hi", location: "123 main st")
    }
}
