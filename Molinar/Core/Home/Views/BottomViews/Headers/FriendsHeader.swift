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
                Text("Explore")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal, 30)
                Spacer()
                
            }
            
        }
    }
}

struct FriendsHeader_Previews: PreviewProvider {
    static var previews: some View {
        FriendsHeader()
    }
}
