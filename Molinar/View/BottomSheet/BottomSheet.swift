//
//  BottomSheet.swift
//  Molinar
//
//  Created by Matt Molinar on 2/10/23.
//

import SwiftUI

struct BottomSheet<Content: View>: View {
    @Binding var searchText: String
    var content: () -> Content
    @Binding var offset: CGFloat


    var body: some View {
        VStack {
            Handle()
                
            HStack(spacing: 15) {
                TextField("Search...", text: .constant(BottomSheetViewModel.shared.searchText))
                    .foregroundColor(Color(.systemGray))
                    .padding(8)
                    .padding(.horizontal, 24)
//                    .background(LinearGradient(gradient: Gradient(colors: [Color.linearGradientSearchBarLead, Color.linearGradientSearchBarTrail]), startPoint: .leading, endPoint: .trailing))
                    .background(Color(.systemGray6))
                    .shadow(color: Color(red: 0.5, green: 0.5, blue: 0.5), radius: 4, x: 2, y: 2)
                    .shadow(color: Color.white, radius: 4, x: -2, y: -2)
                    .cornerRadius(10)

                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                        }
                        )
                Button(action: {
                    BottomSheetViewModel.shared.showAddTaskSheet.toggle()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.blue)
                }

                
            }
            .padding(.horizontal)
            Group {
                self.content()
            }
        }
        
        .background(Color.bottomSheetColor)
        .cornerRadius(15)
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet(searchText: .constant("Hi"), content: {
            VStack {
                Text("hi")
            }
        }, offset: .constant(0))
    }
}

extension Color {
    static let bottomSheetColor = Color("BottomSheet")
    static let linearGradientSearchBarLead = Color("SearchBar1")
    static let linearGradientSearchBarTrail = Color("SearchBar2")
    static let filterButtonLead = Color("FilterButton")
    static let filterButtonTrail = Color("FilterButton2")
    static let handleButtonLead = Color("Handle1")
    static let handleButtonTrail = Color("Handle2")

}
