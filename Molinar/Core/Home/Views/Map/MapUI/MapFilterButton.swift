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
                    .foregroundColor(Color("TrustBlue"))
                    .font(.subheadline)
            }
            .padding(.top, 8)
            .padding(.horizontal, 16)
            
            VStack {
                
            }
            
        }
        .background(.white)
        .cornerRadius(20)
    }
}

