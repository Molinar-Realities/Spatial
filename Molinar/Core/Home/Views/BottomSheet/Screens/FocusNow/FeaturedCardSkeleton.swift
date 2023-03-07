//
//  FeaturedCardSkeleton.swift
//  Molinar
//
//  Created by Matt Molinar on 3/7/23.
//

import SwiftUI

struct FeaturedCardSkeleton: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 200, height: 100)
                .padding(.bottom, 5)
            
            Rectangle()
                .frame(width: 120, height: 16)
                .padding(.bottom, 2)
            
            Rectangle()
                .frame(width: 100, height: 14)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}


struct FeaturedCardSkeleton_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCardSkeleton()
    }
}
