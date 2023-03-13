//
//  InboxView.swift
//  Molinar
//
//  Created by Matt Molinar on 3/10/23.
//

import SwiftUI

struct InboxView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                Spacer()
                HStack {
                    Spacer()
                    Text("Looks like everything is organized!")
                        .foregroundColor(.gray)
                    Spacer()
                }
                Button(action: {
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
                        Image(systemName: "plus.app.fill")
                            .foregroundColor(.gray)
                        Text("to add a task to your inbox.")
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

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
    }
}
