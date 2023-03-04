//
//  RecommendedSheetView.swift
//  Molinar
//
//  Created by Matt Molinar on 2/12/23.
//

import SwiftUI

struct RecommendedSheetView: View {
    @Binding var presented: Bool
    @Binding var selectedIndex: Int

    
    var body: some View {
        VStack {
            Text("Hi")
        }
    }
}


struct RecommendedSheetView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedSheetView(presented: .constant(true), selectedIndex: .constant(1))
    }
}

