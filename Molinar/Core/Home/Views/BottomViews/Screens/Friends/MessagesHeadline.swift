//
//  MessagesHeadline.swift
//  Molinar
//
//  Created by Matt Molinar on 3/8/23.
//

import SwiftUI

struct MessagesHeadline: View {
    var body: some View {
        HStack {
            Text("What's the move?")
                .font(.headline)
                .foregroundColor(.black)
            Spacer()
        }
    }
}

struct MessagesHeadline_Previews: PreviewProvider {
    static var previews: some View {
        MessagesHeadline()
    }
}
