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
                    
                    if isSearchActive {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("Search", text: self.$searchText)
                            Spacer()
                            Image(systemName: "x.circle.fill")
                                .onTapGesture {
                                    isSearchActive.toggle()
                                }
                        }
                        .foregroundColor(Color(UIColor.secondaryLabel))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 5)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.quaternaryLabel)))
//                        .padding([.horizontal, .bottom])
                    } else {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .accentColor(.white)
                            .font(.system(size: 18))

                            .padding(.leading, 8)
                            .onTapGesture {
                                isSearchActive.toggle()
                                self.bottomSheetPosition = .relativeTop(0.97)
                            }
                        Spacer()
                        
                        
                        Spacer()
                        Image(systemName: "person.2.fill")
                            .foregroundColor(.gray)
                            .accentColor(.white)
                            .font(.system(size: 18))
                            .overlay(
                                ZStack {
                                    Circle()
                                        .foregroundColor(.red)
                                        .frame(width: 18, height: 18)
                                    
                                    Text("3")
                                        .font(.system(size: 12))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .offset(x: 8, y: -8), alignment: .topTrailing)


                        Image(systemName: "bubble.right.fill")
                            .foregroundColor(.gray)
                            .accentColor(.white)
                            .font(.system(size: 18))

                            .padding(.horizontal, 8)
                            .overlay(
                                ZStack {
                                    Circle()
                                        .foregroundColor(.red)
                                        .frame(width: 18, height: 18)
                                    
                                    Text("5")
                                        .font(.system(size: 12))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                .offset(x: 0, y: -8), alignment: .topTrailing)
                            
                            
                        
                    }
                   
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



