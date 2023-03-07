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
    @State var completed = false
    @State var removed = false
    @State var dueDate = Date()
    
    var body: some View {
        HStack {
            Button(action: {
                let impact = UIImpactFeedbackGenerator(style: .medium)
                impact.impactOccurred()
                
                DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 3) {
                                   removed.toggle()
                               }
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
                        .opacity(removed ? 0 : 1)
                        .animation(.easeInOut(duration: 0.3))
            Text("title")
                                .opacity(removed ? 0 : 1)
                                .animation(.easeInOut(duration: 0.3))
            Spacer()
            Text(dueDate.isToday ? dueDate.toString(dateFormat: "h:mm a") : dueDate.toString(dateFormat: "MMM d"))
                .opacity(removed ? 0 : 1)
                .animation(.easeInOut(duration: 0.3))
        }
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell()
    }
}
