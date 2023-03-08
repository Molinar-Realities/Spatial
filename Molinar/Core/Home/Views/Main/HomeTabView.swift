//
//  HomeTabView.swift
//  Molinar
//
//  Created by Matt Molinar on 3/8/23.
//

import SwiftUI

struct HomeTabView: View {
    @Binding var isShowingTaskSheet: Bool
    @Binding var selectedIndex: Int
    var icons: [String]
    
    var body: some View {
        HStack {
            ForEach(0..<3, id: \.self) { number in
                Spacer()
                Button(action: {
                    if number == 1 {
                        isShowingTaskSheet.toggle()
                        // Generate haptic feedback
                        let generator = UIImpactFeedbackGenerator(style: .light)
                        generator.prepare()
                        generator.impactOccurred()
                    } else {
                        self.selectedIndex = number
                    }
                }) {
                    Image(systemName: icons[number])
                        .font(.system(size: 25))
                        .foregroundColor(selectedIndex == number ? .blue : Color(UIColor.white))
                }
                Spacer()
            }
        }
        .padding(.top, 4)
        .background(.black)
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView(isShowingTaskSheet: .constant(false), selectedIndex: .constant(0), icons: ["globe.americas.fill", "plus.app.fill", "figure.2.arms.open"])
    }
}
