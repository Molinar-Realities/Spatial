//
//  ConversationCell.swift
//  Molinar
//
//  Created by Matt Molinar on 3/8/23.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 38, height: 38)
                .foregroundColor(.gray)
            VStack(alignment: .leading) {
                Text("molinar.matthew")
                    .font(.subheadline)
                Text("Worked out 2h ago")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
