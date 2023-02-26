//
//  HomeScreenContent.swift
//  Molinar
//
//  Created by Matt Molinar on 2/11/23.
//

import SwiftUI

struct HomeScreenContent: View {
    @Binding var presentingEventDetailSheet: Bool
    var body: some View {
        VStack {
            
            ScrollView(.vertical, showsIndicators: false) {
                ScheduleHeadline()
                
                RecommendedEvents(presentingEventDetailSheet: $presentingEventDetailSheet)
                
                ShortcutsHeadline()
                
                ForEach(0 ..< 30) { item in
                    NewsCell()
                }
                
            }
            .padding()
        }
    }
}


struct HomeScreenContent_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenContent(presentingEventDetailSheet: .constant(false))
    }
}
