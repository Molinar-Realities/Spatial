//
//  FriendsBottomTab.swift
//  Molinar
//
//  Created by Matt Molinar on 3/1/23.
//

import SwiftUI

struct FriendsBottomTab: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text("Messages")
                    .font(.headline)
                Spacer()
            }
            VStack(spacing: 15) {
                ForEach(0 ..< 10) { item in
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
        }
        .padding(.horizontal)
    }
}

struct FriendsBottomTab_Previews: PreviewProvider {
    static var previews: some View {
        FriendsBottomTab()
    }
}
