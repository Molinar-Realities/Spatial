//
//  FriendsBottomTab.swift
//  Molinar
//
//  Created by Matt Molinar on 3/1/23.
//

import SwiftUI
import BottomSheet

struct FriendsBottomTab: View {
    @Binding var searchText: String
    @Binding var bottomSheetPosition: BottomSheetPosition
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            
            MessagesHeadline()
//            VStack(spacing: 15) {
//                ForEach(0 ..< 10) { item in
//                    ConversationCell()
//                }
//            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("Coming soon")
                        .foregroundColor(.gray)
                        
                    Spacer()
                }
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

struct FriendsBottomTab_Previews: PreviewProvider {
    static var previews: some View {
        FriendsBottomTab(searchText: .constant(""), bottomSheetPosition: .constant(.relativeTop(0.5)))
    }
}




