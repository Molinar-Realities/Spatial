//
//  FocusNowHeader.swift
//  Molinar
//
//  Created by Matt Molinar on 3/8/23.
//

import SwiftUI

struct FocusNowHeader: View {
    var body: some View {
        Text("My Schedule")
            .foregroundColor(.black)
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.horizontal, 30)
//        EmptyView()
    }
}
struct FocusNowHeader_Previews: PreviewProvider {
    static var previews: some View {
        FocusNowHeader()
    }
}
