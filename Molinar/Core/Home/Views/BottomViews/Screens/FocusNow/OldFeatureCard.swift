//
//  OldFeatureCard.swift
//  Molinar
//
//  Created by Matt Molinar on 3/8/23.
//

import SwiftUI

struct OldFeatureCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("From Tasks")
                .foregroundColor(.gray)
                .font(.footnote)
            // TO DO: Make the cards from Apple Music.
            VStack(alignment: .leading, spacing: 2) {
                Image("study")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 155, height: 155)
                    .cornerRadius(10)
                    .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 0, y: 2)
                    .padding(.bottom, 5)
                Text("hi")
                    .frame(width: 155, alignment: .leading)
                    .lineLimit(1)
                    .truncationMode(.tail)
                Text("hi")
                    .frame(width: 155, alignment: .leading)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            
            
            
            
            
        }
    }
}

struct OldFeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        OldFeatureCard()
    }
}
