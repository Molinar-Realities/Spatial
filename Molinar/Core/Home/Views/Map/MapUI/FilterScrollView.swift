//
//  FilterScrollView.swift
//  Molinar
//
//  Created by Matt Molinar on 3/8/23.
//

import SwiftUI

enum FeedFilterOptions: Int, CaseIterable {
    case home
    case calendar
    case tasks
    case events
    case posts
}


struct FilterScrollView: View {
    @Binding var selectedFeed:FeedFilterOptions
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack(alignment: .trailing) {
                HStack(alignment: .top, spacing: 15) {
                    MapFilterButton(filterLabel: "Suggest Change")
                        .onTapGesture {
                            selectedFeed = .tasks
                        }
                    MapFilterButton(filterLabel: "Report Bug")
                        .onTapGesture {
                            selectedFeed = .tasks
                        }
                   
                }
                .padding()
                Spacer()
                    .fixedSize()
            }
        }
    }
}

struct FilterScrollView_Previews: PreviewProvider {
    static var previews: some View {
        FilterScrollView(selectedFeed: .constant(.home))
    }
}
