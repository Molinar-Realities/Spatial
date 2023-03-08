//
//  FilterScrollView.swift
//  Molinar
//
//  Created by Matt Molinar on 3/8/23.
//

import SwiftUI

struct FilterScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                HStack(alignment: .top, spacing: 15) {
                    MiniCalendar()
                    MapFilterButton(filterLabel: "Tasks")
                    MapFilterButton(filterLabel: "Fitness")
                    Spacer()
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
        FilterScrollView()
    }
}
