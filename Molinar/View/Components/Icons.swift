//
//  Icons.swift
//  Molinar
//
//  Created by Matt Molinar on 2/23/23.
//

import SwiftUI

struct IconButtonWithLabel: View {
    let icon: Image
    let label: String
        
    var body: some View {
        Button(action: {}) {
            HStack {
                icon
                    .resizable()
                    .scaledToFill()
                    .frame(width: 12, height: 12)
                Text(label)
            }
        }
    }
}

struct InboxIcon: View {
    var body: some View {
        IconButtonWithLabel(icon: Image(systemName: "tray.fill"), label: "Inbox")
    }
}

struct IconButton: View {
    let icon: Image
    
    var body: some View {
        Button(action: {}) {
            icon
                .resizable()
                .scaledToFill()
                .frame(width: 12, height: 12)
        }
    }
}


