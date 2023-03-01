//
//  AppHeader.swift
//  Molinar
//
//  Created by Matt Molinar on 3/1/23.
//

import SwiftUI

struct AppHeader: View {
    var body: some View {
        
        ZStack {
            BlurView()
                .ignoresSafeArea()
            HStack {
                Image("AppLogo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 38, height: 38)
                Spacer()
                Circle()
                    .frame(width: 38, height: 38)
            }
            .padding(.horizontal)
        }
        .frame(height: 55)
    }
}

struct AppHeader_Previews: PreviewProvider {
    static var previews: some View {
        AppHeader()
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

