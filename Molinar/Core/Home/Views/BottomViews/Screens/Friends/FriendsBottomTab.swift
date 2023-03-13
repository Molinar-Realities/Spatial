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
    @State var selectedOption: FriendFilterOptions = .messages
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            FriendFilterButtons(selectedOption: $selectedOption)
            if selectedOption == .messages {
                MessagesHeadline()
                    .padding(.horizontal)
            } else if selectedOption == .students {
                HStack {
                    Text("Students")
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                }
            }
            

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




