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
}


struct FilterScrollView: View {
    @Binding var selectedFeed:FeedFilterOptions
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                HStack(alignment: .top, spacing: 15) {
//                    MiniCalendar()
//                        .onTapGesture {
//                            selectedFeed = .calendar
//                        }
                    
                    MapFilterButton(filterLabel: "Nature")
                        .onTapGesture {
                            selectedFeed = .home
                        }
                    MapFilterButton(filterLabel: "Hangs")
                        .onTapGesture {
                            selectedFeed = .tasks
                        }
                    MapFilterButton(filterLabel: "Parties")
                        .onTapGesture {
                            selectedFeed = .tasks
                        }
                    MapFilterButton(filterLabel: "Workouts")
                        .onTapGesture {
                            selectedFeed = .tasks
                        }

                    MapFilterButton(filterLabel: "Food")
                        .onTapGesture {
                            selectedFeed = .tasks
                        }
                    MapFilterButton(filterLabel: "Co-working")
                        .onTapGesture {
                            selectedFeed = .tasks
                        }

//                    MapFilterButton(filterLabel: "Fitness")
//                    MapFilterButton(filterLabel: "Energy")
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
        FilterScrollView(selectedFeed: .constant(.home))
    }
}
