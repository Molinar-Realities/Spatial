//
//  FriendsHeader.swift
//  Molinar
//
//  Created by Matt Molinar on 3/8/23.
//

import SwiftUI

struct FriendsHeader: View {
    var body: some View {
        VStack {
            HStack {
                Text("Close Friends")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 38, height: 38)
                        .padding(.horizontal)
                }
                .disabled(true)
            }
            
        }
    }
}

struct FriendsHeader_Previews: PreviewProvider {
    static var previews: some View {
        FriendsHeader()
    }
}
