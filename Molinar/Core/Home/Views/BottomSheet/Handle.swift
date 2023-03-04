//
//  Handle.swift
//  Molinar
//
//  Created by Matt Molinar on 2/10/23.
//

import SwiftUI

struct Handle: View {
    private let handleThickness = CGFloat(5.0)
    var body: some View {
        RoundedRectangle(cornerRadius: handleThickness / 2.0)
//            .fill(LinearGradient(gradient: Gradient(colors: [Color.handleButtonLead, Color.handleButtonTrail]), startPoint: .leading, endPoint: .trailing))
            .frame(width: 36, height: handleThickness)
            .foregroundColor(Color.gray)
            .padding(5)
            .shadow(color: Color(red: 0.5, green: 0.5, blue: 0.5), radius: 4, x: 2, y: 2)
            .shadow(color: Color.white, radius: 4, x: -2, y: -2)
    }
}

struct Handle_Previews: PreviewProvider {
    static var previews: some View {
        Handle()
    }
}
