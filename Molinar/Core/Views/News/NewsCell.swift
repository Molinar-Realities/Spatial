//
//  NewsCell.swift
//  Molinar
//
//  Created by Matt Molinar on 2/11/23.
//

import SwiftUI

struct NewsCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                Image("matt")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 32, height: 32)
                    .cornerRadius(16)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("matthew molinar")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)
                        
                        Text("@god")
                            .foregroundColor(.gray)
                        Text("2w")
                            .foregroundColor(.gray)
                    }
                    Text("matthew molinar just joined")
                        .foregroundColor(.gray)
                }
            }
            .padding(.bottom)
            .padding(.trailing)
            Divider()
        }
        .padding(.horizontal)
        .padding(.leading, -16)
    }
}
