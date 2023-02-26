//
//  Extensions.swift
//  Molinar
//
//  Created by Matt Molinar on 2/23/23.
//

import SwiftUI

struct Extensions: View {
    var body: some View {
        Text("Hi")
    }
}

struct Extensions_Previews: PreviewProvider {
    static var previews: some View {
        Extensions()
    }
}

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
