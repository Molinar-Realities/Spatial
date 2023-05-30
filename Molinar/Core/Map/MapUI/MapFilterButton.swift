//
//  MapFilterButton.swift
//  Molinar
//
//  Created by Matt Molinar on 3/8/23.
//

import SwiftUI

struct MapFilterButton: View {
    var filterLabel: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                
                Text(filterLabel)
                    .font(.subheadline)
                    
            }
            .foregroundColor(Color.black)
            .padding(.top, 8)
            .padding(.horizontal, 16)
            
            VStack {
                
            }
            
        }
        .background(.white)
        .cornerRadius(20)
        .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                )
    }
}

