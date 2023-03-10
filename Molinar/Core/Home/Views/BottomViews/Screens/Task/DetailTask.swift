//
//  DetailTask.swift
//  Molinar
//
//  Created by Matt Molinar on 3/9/23.
//

import SwiftUI

struct DetailTask: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(spacing: 10) {
                Image(systemName: "mappin.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.gray)
                Text("123 Main St, Austin TX, 78705")
                    .foregroundColor(.gray)
                Spacer()
                    
            }.padding(.horizontal)
            Divider()
            HStack(spacing: 10){
                Image(systemName: "calendar")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.green)
                Text("Today 3PM")
                    .foregroundColor(.green)
            }.padding(.horizontal)
            
            Divider()
//            HStack {
//                Spacer()
//                Button(action: {}) {
//                    VStack {
//                        Image(systemName:"play.circle.fill")
//                            .resizable()
//                            .scaledToFill()
//                        .frame(width: 64, height: 64)
//                        Text("Focus Now")
//                    }
//                }
//                .disabled(true)
//                Spacer()
//            }.padding(.top, 16)
            
            
        }
    }
}

struct DetailTask_Previews: PreviewProvider {
    static var previews: some View {
        DetailTask()
    }
}
