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
            
            ForEach(0..<5, id: \.self) { index in
                Button(action: {
                    switch index {
                    case 0:
                        selectedFeed = .home
                    case 1:
                        selectedFeed = .home
                    case 2:
                        let generator = UIImpactFeedbackGenerator(style: .light)
                        generator.prepare()
                        generator.impactOccurred()
                        isShowingTaskSheet.toggle()
                    case 3:
                        selectedFeed = .home
                    case 4:
                        selectedFeed = .home
                    default:
                        break
                    }
                    selectedIndex = index
                }) {
                    if index == 2 {
                        Spacer()
                        Image(systemName: icons[2])
                                                           .font(.system(size: 25))
                                                           .foregroundColor(Color(UIColor.white))
                                                           .overlay(LinearGradient(gradient: Gradient(stops: [
                                                               Gradient.Stop(color: gradientColors[0], location: 0),
                                                               Gradient.Stop(color: gradientColors[1], location: 1)
                                                           ]), startPoint: .leading, endPoint: .trailing))
                                                           .mask(Image(systemName: icons[2]).font(.system(size: 25)))
                        Spacer()
                    } else {
                        Spacer()
                            Image(systemName: selectedIndex == 4 ? icons[index] : selectedIndex == index ? "\(icons[index]).fill" : icons[index])
                                .font(.system(size: 25))
                                .foregroundColor(selectedIndex == index ? .white : Color(UIColor.gray))
                        Spacer()
           
                    }
                    
                }
                
            }
        }
        .padding(.top, 8)
        .background(Color.black)
    }
    
    private func getTitle(for index: Int) -> String {
        switch index {
        case 0:
            return "Explore"
        case 1:
            return "Store"
        case 2:
            return "Task"
        case 3:
            return "Friends"
        case 4:
            return "Menu"
        default:
            return ""
        }
    }
}



struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView( isShowingTaskSheet: .constant(false), selectedIndex: .constant(0), icons: ["globe.americas.fill", "plus.app.fill", "figure.2.arms.open"], selectedFeed: .constant(.home) )
    }
}
