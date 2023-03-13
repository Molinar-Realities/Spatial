//
//  FriendsFilterOptions.swift
//  Molinar
//
//  Created by Matt Molinar on 3/11/23.
//

import SwiftUI

enum FriendFilterOptions: Int, CaseIterable {
    case messages
    case students
    
    var text: String {
        switch self {
        case .messages: return "Messages"
        case .students: return "Students"
        }
    }
}

struct FriendFilterButtons: View {
    @Binding var selectedOption:FriendFilterOptions
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(FriendFilterOptions.allCases.count)
    private var padding: CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue)
        let count = CGFloat(FriendFilterOptions.allCases.count)
        return (UIScreen.main.bounds.width / count * rawValue + 16)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                ForEach(FriendFilterOptions.allCases, id: \.self) { option in
                    Button(action: {
                        self.selectedOption = option
                    }, label: {
                        Text(option.text)
                            .frame(width: underlineWidth - 4)
                    })
                }
            }
            .padding(.bottom)
            Rectangle()
                .frame(width: underlineWidth - 24, height: 3, alignment: .center)
                .foregroundColor(.blue)
                .padding(.leading, padding)
                .animation(.spring())
            Divider()
                
        }
    }
}

struct FriendsFilterButtons_Previews: PreviewProvider {
    static var previews: some View {
        FriendFilterButtons(selectedOption: .constant(.messages))
    }
}
