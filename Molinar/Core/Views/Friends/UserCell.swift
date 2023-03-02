//
//  UserCell.swift
//  Molinar
//
//  Created by Matt Molinar on 2/21/23.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Image("matt")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Matt Molinar")
                        .font(.system(size: 14, weight: .semibold))
                    Text("the servers are about to crash..")
                        .font(.system(size: 15))
                                                .lineLimit(2)

                }
                .foregroundColor(.black)
                .padding(.trailing)
                Spacer()
            }.padding()
            Divider()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
