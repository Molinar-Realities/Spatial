//
//  ForYou.swift
//  Molinar
//
//  Created by Matt Molinar on 3/13/23.
//

import SwiftUI

struct ForYou: View {
    
    var body: some View {
      
        // Main VStack
            VStack(alignment: .leading, spacing: 15) {
//                Text("Focus Now")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .padding(.horizontal)
                // Card slide shows
                    
                // Tasks from Calendar
                VStack(alignment: .leading, spacing: 5) {
                    // Header for Tasks from Calendar
//                    Text("Recent Moves")
//                        .font(.headline)
//                        .padding(.horizontal)
//                        .padding(.top)
                    // ScrollView for cards
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            // HACK
                            Rectangle()
                                .frame(width: 10, height: 187)
                                .foregroundColor(.clear)
                            // HACK
                            ForEach(0 ..< 5) { item in
                                VStack(alignment: .leading, spacing: 10) {
                                    HStack {
                                        Text("mattmolinar")
                                            .foregroundColor(.gray)
                                        .font(.footnote)
                                    }
                                    // TO DO: Make the cards from Apple Music.
                                    Rectangle()
                                        .frame(width: 155, height: 155)
                                        .cornerRadius(10)
                                        .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 0, y: 2)
                                        .padding(.bottom, 5)


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
                
                WorkoutNow()
                    .padding(.horizontal)
                
                // Your tasks, top projects
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 5) {
                    //Header
                        Text("Your Projects")
                            .font(.headline)
                            .padding(.leading)
                        .fontWeight(.bold)
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color(.systemGray))
                            .fontWeight(.bold)
                    }
                    
                    // ScrollView for cards
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            // HACK
                            Rectangle()
                                .frame(width: 10, height: 187)
                                .foregroundColor(.clear)
                            // HACK
                            ForEach(0 ..< 5) { item in
                                VStack(alignment: .leading, spacing: 2) {
                                    // TO DO: Make the cards from Apple Music.
                                    Rectangle()
                                        .frame(width: 170, height: 170)
                                        .cornerRadius(10)
                                        .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 0, y: 2)
                                        .padding(.bottom, 5)
                                    Text("Work")
                                        .frame(width: 170, alignment: .leading)
                                        .lineLimit(1)
                                        .truncationMode(.tail)
                                    Text("Number of tasks")
                                        .frame(width: 170, alignment: .leading)
                                        .foregroundColor(.gray)
                                        .lineLimit(1)
                                        .truncationMode(.tail)
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
                
                // Your tasks, top projects
                
                VStack(alignment: .leading, spacing: 10) {
                    //Header
                    HStack(spacing: 5) {
                        Text("Friends Are Doing")
                            .font(.headline)
                            .padding(.leading)
                        .fontWeight(.bold)
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color(.systemGray))
                            .fontWeight(.bold)
                    }
                    
                    // ScrollView for cards
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            // HACK
                            Rectangle()
                                .frame(width: 10, height: 187)
                                .foregroundColor(.clear)
                            // HACK
                            ForEach(0 ..< 5) { item in
                                VStack(alignment: .leading, spacing: 2) {
                                    // TO DO: Make the cards from Apple Music.
                                    Rectangle()
                                        .frame(width: 170, height: 170)
                                        .cornerRadius(10)
                                        .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 0, y: 2)
                                        .padding(.bottom, 5)
                                    Text("Work")
                                        .frame(width: 170, alignment: .leading)
                                        .lineLimit(1)
                                        .truncationMode(.tail)
                                    Text("Number of tasks")
                                        .frame(width: 170, alignment: .leading)
                                        .foregroundColor(.gray)
                                        .lineLimit(1)
                                        .truncationMode(.tail)


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
                Spacer()
            }
        
    }
}

struct FocusNow_Previews: PreviewProvider {
    static var previews: some View {
        ForYou()
    }
}
