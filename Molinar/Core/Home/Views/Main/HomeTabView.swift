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
    let gradientColors = [Color(red: 19/255, green: 111/255, blue: 220/255), Color(red: 101/255, green: 231/255, blue: 208/255)]
    @Binding var selectedFeed: FeedFilterOptions


    var body: some View {
        HStack {
            Spacer()

            Button(action: {
                selectedFeed = .home
                selectedIndex = 0
            }) {
                VStack {
                    Image(systemName: selectedIndex == 0 ? "\(icons[0]).fill" : icons[0])
                        .font(.system(size: 25))
                        .foregroundColor(selectedIndex == 0 ? .white : Color(UIColor.gray))
                    Text("Home")
                        .font(.caption2)
                        .foregroundColor(selectedIndex == 0 ? .white : Color(UIColor.gray))
                }
                
            }

            Spacer()

            Button(action: {
                isShowingTaskSheet.toggle()

            }) {
                Image(systemName: selectedIndex == 1 ? "\(icons[1]).fill" : icons[1])
                                    .font(.system(size: 25))
                                    .foregroundColor(selectedIndex == 1 ? .blue : Color(UIColor.white))
                                    .overlay(LinearGradient(gradient: Gradient(stops: [
                                        Gradient.Stop(color: gradientColors[0], location: 0),
                                        Gradient.Stop(color: gradientColors[1], location: 1)
                                    ]), startPoint: .leading, endPoint: .trailing))
                                    .mask(Image(systemName: icons[1]).font(.system(size: 25)))
            }

            Spacer()

            Button(action: {
                selectedIndex = 2
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.prepare()
                generator.impactOccurred()
            }) {
                VStack {
                    Image(systemName: selectedIndex == 2 ? "\(icons[2]).fill" : icons[2])
                        .font(.system(size: 25))
                        .foregroundColor(selectedIndex == 2 ? .white : Color(UIColor.gray))
                    Text("Friends")
                        .font(.caption2)
                        .foregroundColor(selectedIndex == 2 ? .white : Color(UIColor.gray))
                }
               
            }

            Spacer()
        }
        .padding(.top, 4)
        .background(Color.black)
    }
}


struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView( isShowingTaskSheet: .constant(false), selectedIndex: .constant(0), icons: ["globe.americas.fill", "plus.app.fill", "figure.2.arms.open"], selectedFeed: .constant(.home) )
    }
}
