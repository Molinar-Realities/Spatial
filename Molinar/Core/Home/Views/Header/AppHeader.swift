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
                    Image("WeakerBlueGreenLogo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 38, height: 38)
                        .onTapGesture {
                        }
                    Spacer()
                    VStack {
                        Text("Happening Now")
                            .fontWeight(.bold)
                            .font(.body)
                            .foregroundColor(.green)
                        Text("Meeting with co-founders")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    Spacer()
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(.gray)
                        .frame(width: 18, height: 18)
                    
                    Spacer()
                    Image(systemName: "bell.fill")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(.gray)
                        .frame(width: 18, height: 18)
                    Spacer()
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

