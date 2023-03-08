//
//  RecommendedTasks.swift
//  Molinar
//
//  Created by Matt Molinar on 3/8/23.
//

import SwiftUI

struct RecommendedTasks: View {
    @EnvironmentObject var viewModel: TasksViewModel
    
    var hardCodedTasks = [Task(dictionary: ["title": "Meditate", "taskLocationTitle": "Based on steps", "id": "1"]), Task(dictionary: ["title": "Go for a run", "taskLocationTitle": "Based on your goals", "id": "2"])]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                // HACK
                Rectangle()
                    .frame(width: 10, height: 187)
                    .foregroundColor(.clear)
                // HACK
                ForEach(0..<2) { index in
                    VStack(alignment: .leading, spacing: 10) {
                        // TO DO: Make the cards from Apple Music.
                        FeaturedCard(task: hardCodedTasks[index])
                    }
                }
                // HACK
                Rectangle()
                    .frame(width: 10, height: 187)
                    .foregroundColor(.clear)
                // HACK
            }
        }
        .edgesIgnoringSafeArea(.horizontal)
    }
}

//struct RecommendedTasks_Previews: PreviewProvider {
//    static var previews: some View {
//        RecommendedTasks()
//    }
//}
