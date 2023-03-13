//
//  EmptyProjectsList.swift
//  Molinar
//
//  Created by Matt Molinar on 3/11/23.
//

import SwiftUI

struct EmptyProjectsList: View {
    @Binding var showAddProject: Bool
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                Spacer()
                HStack {
                    Spacer()
                    Text("Looks like you don't have any projects")
                        .foregroundColor(.gray)
                    Spacer()
                }
                Button(action: {
                    showAddProject.toggle()
                    // Generate haptic feedback
                    let generator = UIImpactFeedbackGenerator(style: .light)
                    generator.prepare()
                    generator.impactOccurred()
                }) {
                    HStack {
                        Spacer()
                        Text("Tap")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.gray)
                        Text("to create a project.")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Spacer()
                    }
                }
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}

struct EmptyProjectsList_Previews: PreviewProvider {
    static var previews: some View {
        EmptyProjectsList(showAddProject: .constant(true))
    }
}
