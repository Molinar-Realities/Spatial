//
//  RecommendedEvents.swift
//  Molinar
//
//  Created by Matt Molinar on 2/11/23.
//

import SwiftUI

struct RecommendedEvents: View {
    @Binding var presentingEventDetailSheet: Bool
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(0..<4) { index in
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
                                Text("Event \(index)")
                                    .font(.subheadline)
                                Spacer()
                            }
                            .padding(.horizontal, 3) //idk if this is good
                        }
                    }
                    
                }
            }
        }
    }
}


struct RecommendedEvents_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedEvents(presentingEventDetailSheet: .constant(false))
    }
}
