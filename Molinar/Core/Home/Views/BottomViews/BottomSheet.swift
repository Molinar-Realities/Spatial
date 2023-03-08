//
//  BottomSheet.swift
//  Molinar
//
//  Created by Matt Molinar on 2/10/23.
//

import SwiftUI

struct BottomSheet<Content: View>: View {
    @Binding var searchText: String
    var content: () -> Content
    @Binding var offset: CGFloat


    var body: some View {
        VStack {
            Handle()
                
            
            Group {
                self.content()
            }
        }
        
        .background(Color.bottomSheetColor)
        .cornerRadius(15)
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet(searchText: .constant("Hi"), content: {
            VStack {
                Text("hi")
            }
        }, offset: .constant(0))
    }
}


