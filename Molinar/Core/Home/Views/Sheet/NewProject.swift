//
//  NewProject.swift
//  Molinar
//
//  Created by Matt Molinar on 3/11/23.
//

import SwiftUI

struct NewProject: View {
    @State private var projectTitle = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Button(action: {}) {
                    Text("Cancel")
                }
                Spacer()
                Text("New Project")
                    .fontWeight(.bold)
                Spacer()
                Button(action: {}) {
                    Text("Done")
                }
                .disabled(true)
            }
            .padding()
            
            TextField("Name your project", text: $projectTitle)
                .padding()
            
            Spacer()
        }
    }
}

struct NewProject_Previews: PreviewProvider {
    static var previews: some View {
        NewProject()
    }
}
