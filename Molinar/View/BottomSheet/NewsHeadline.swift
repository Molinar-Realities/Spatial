//
//  NewsHeadline.swift
//  Molinar
//
//  Created by Matt Molinar on 2/11/23.
//

import SwiftUI

struct ShortcutsHeadline: View {
    var body: some View {
        HStack {
            Text("World News")
                .font(.headline)
            
            Spacer()
        }
        .padding(.vertical)
    }
}

struct NewsHeadline_Previews: PreviewProvider {
    static var previews: some View {
        ShortcutsHeadline()
    }
}
