//
//  AppHeader.swift
//  Molinar
//
//  Created by Matt Molinar on 3/1/23.
//

import SwiftUI
import Kingfisher

struct AppHeader: View {
    let user: User
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        
        ZStack {
            
            HStack {
                Image("AppLogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 38, height: 38)
                Spacer()
                NavigationView {
                    NavigationLink(destination: ProfileView(viewModel: viewModel)) {
                        KFImage(URL(string: viewModel.user.profilePictureUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .shadow(color: .black, radius: 3, x:0.0, y:0.0)
                    }
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 55)
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

