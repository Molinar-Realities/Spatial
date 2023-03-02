//
//  AppHeader.swift
//  Molinar
//
//  Created by Matt Molinar on 3/1/23.
//

import SwiftUI
import Kingfisher

struct AppHeader: View {
    private let user: User
    @ObservedObject private var viewModel: ProfileViewModel
    @State var showProfile = false
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }

    var body: some View {
        
            ZStack {
                HStack {
                    Image("AppLogo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 38, height: 38)
                        .onTapGesture {
                            AuthViewModel.shared.signOut()
                        }
                    Spacer()
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
                .padding(.horizontal)
            }
            .frame(height: 55)
            .fullScreenCover(isPresented: $showProfile) {
                ProfileView(user: user, showSheet: $showProfile)
            }
        .background(.black)
        }
    
}



struct BlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: .systemChromeMaterial)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.alpha = 0.8 // Set a lower alpha value to make the blur less strong
        blurView.backgroundColor = .systemGray
        return blurView
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.alpha = 0.8 // Update alpha value in case it changes
    }
}

