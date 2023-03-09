//
//  FocusNowHeader.swift
//  Molinar
//
//  Created by Matt Molinar on 3/8/23.
//

import SwiftUI

struct FocusNowHeader: View {
    var body: some View {
        Text("Focus Now")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.horizontal)
    }
}
struct FocusNowHeader_Previews: PreviewProvider {
    static var previews: some View {
        FocusNowHeader()
    }
}