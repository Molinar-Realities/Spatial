//
//  LocationHeader.swift
//  Molinar
//
//  Created by Matt Molinar on 2/23/23.
//

import SwiftUI

struct LocationHeader: View {
    var headerText: String
    var body: some View {
        HStack {
            Text(headerText)
            IconButton(icon: Image(systemName: "questionmark.circle.fill"))
            Spacer()
        }
    }
}

struct LocationHeader_Previews: PreviewProvider {
    static var previews: some View {
        LocationHeader(headerText: "Location")
    }
}
