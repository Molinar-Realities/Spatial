//
//  FilterButtonView.swift
//  Molinar
//
//  Created by Matt Molinar on 3/2/23.
//

import SwiftUI

enum FilterOptionsProfile: Int, CaseIterable {
    case activity
    case items
    
    var text: String {
        switch self {
        case .activity: return "Activity"
        case .items: return "Items"
        }
    }
}

struct FilterButtonView: View {
    @Binding var selectedOption:FilterOptionsProfile
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(FilterOptionsProfile.allCases.count)
    private var padding: CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue)
        let count = CGFloat(FilterOptionsProfile.allCases.count)
        return (UIScreen.main.bounds.width / count * rawValue + 16)
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(FilterOptionsProfile.allCases, id: \.self) { option in
                    Button(action: {
                        self.selectedOption = option
                    }, label: {
                        Text(option.text)
                            .frame(width: underlineWidth - 4)
                    })
                }
            }
            Rectangle()
                .frame(width: underlineWidth - 24, height: 3, alignment: .center)
//                .foregroundColor(Color("Custom Accent"))
                .padding(.leading, padding)
                .animation(.spring())
                
        }
    }
}
