//
//  ProjectsList.swift
//  Molinar
//
//  Created by Matt Molinar on 3/11/23.
//

import SwiftUI

struct ProjectsList: View {
    var body: some View {
        VStack {
            Spacer()
            ProjectCell()
            Spacer()
        }
    }
}

struct ProjectsList_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsList()
    }
}

struct ProjectCell: View {
    var body: some View {
        VStack {
            HStack {
                Text("Project Name")
                Spacer()
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.gray)
                    .frame(width: 8, height: 8)
            }
            .padding()
        }
    }
}
