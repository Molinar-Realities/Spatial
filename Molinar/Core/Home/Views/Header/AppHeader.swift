//
//  AppHeader.swift
//  Molinar
//
//  Created by Matt Molinar on 3/1/23.
//

import SwiftUI
import Kingfisher
import BottomSheet

struct AppHeader: View {
    private let user: User
    @ObservedObject private var viewModel: ProfileViewModel
    @State var showProfile = false
    @State private var isSearchActive = false
    @State var searchText: String = ""
    @Binding var bottomSheetPosition: BottomSheetPosition



    
    init(user: User, bottomSheetPosition: Binding<BottomSheetPosition>) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
        self._bottomSheetPosition = bottomSheetPosition
    }


    var body: some View {
        
            ZStack {
             
                    
                HStack(alignment: .center) {
                    Image("TransparentBat")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                        .onTapGesture {
                        }
                        .padding(.horizontal, 8)
                    Divider()
                        .padding(.vertical, 10)
                    
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color.gray)
                            TextField("Search here", text: self.$searchText)
                            Spacer()
                            
                        }
//                        .foregroundColor(Color(UIColor.secondaryLabel))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 5)
//                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.quaternaryLabel)))
//                        .padding([.horizontal, .bottom])
                    
                   
                    Divider()
                    .padding(.vertical, 8)
                    Button(action: {
                        showProfile.toggle()
                    }) {
                        KFImage(URL(string: viewModel.user.profilePictureUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 38, height: 38)
                        .clipShape(Circle())
                    }
                        
                    
                }
                .frame(height: 55)
                .padding(.horizontal)
            }
            .sheet(isPresented: $showProfile) {
                ProfileView(user: user, showSheet: $showProfile)
            }
        .background(.white)
        .cornerRadius(55/2)
        .padding(.horizontal)
        }
    
}



struct BlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: .systemChromeMaterial)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.alpha = 0.5 // Set a lower alpha value to make the blur less strong
        blurView.backgroundColor = .systemGray
        return blurView
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.alpha = 0.5 // Update alpha value in case it changes
    }
}



