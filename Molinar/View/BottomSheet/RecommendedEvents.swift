//
//  RecommendedEvents.swift
//  Molinar
//
//  Created by Matt Molinar on 2/11/23.
//

import SwiftUI

struct RecommendedEvents: View {
    @Binding var presentingEventDetailSheet: Bool
    @ObservedObject var viewModel: TasksViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                if viewModel.tasks.count > 0 {
                    ForEach(viewModel.tasks) { task in
                        Button(action: {
                            presentingEventDetailSheet.toggle()
                        }) {
                            VStack {
                                Image("workout2")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 112, height: 93)
                                    .cornerRadius(5)
                                    .overlay {
                                        // overlay a play button here
                                        Image("NormalPlay")
                                            .offset(x: 5, y:3)
                                            
                                            
                                    }
                                HStack {
                                    Text(task.title)
                                        .font(.subheadline)
                                    Spacer()
                                }
                                .padding(.horizontal, 3) //idk if this is good
                            }
                        }
                        
                    }
                } else {
                    VStack {
                        HStack {
                            Spacer()
                            Text("No tasks found.")
                                .foregroundColor(.gray)
                                .font(.caption)
                            Spacer()
                        }
                    }
                }
                
            }
        }
    }
}


struct RecommendedEvents_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedEvents(presentingEventDetailSheet: .constant(false), viewModel: TasksViewModel())
    }
}
