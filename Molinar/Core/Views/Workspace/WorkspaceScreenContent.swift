//
//  WorkspaceScreenContent.swift
//  Molinar
//
//  Created by Matt Molinar on 2/12/23.
//

import SwiftUI

struct WorkspaceScreenContent: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Left Arm")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 4)
            
            HStack {
                Spacer()
                Text("Alternating Dumbbell Curls")
                    .foregroundColor(.black)
                    .font(.body)
                
                Spacer()
            }
            .padding(.horizontal, 30)
            HStack {
                Button(action: {}) {
                    Image(systemName: "list.bullet")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 14, height: 14)
                        .foregroundColor(.gray)
                }
                Spacer()
                VStack {
                    Text("0:30")
                        .offset(y: 5)
                    ProgressView(value: 50, total: 100)
                        .frame(width: UIScreen.main.bounds.width * 0.50)
                }
                
                Spacer()
                Button(action: {}) {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.green)
                }
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 30)
            
            
            Divider()
                .padding(.horizontal, 30)
            
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        Button(action: {}) {
                            VStack {
                                Image(systemName: "square.stack.3d.up")
                                Text("Report")
                                Text("Reps")
                            }
                        }
                        Spacer()
                        
                        Button(action: {}) {
                            VStack {
                                Image(systemName: "folder.fill")
                                Text("Open")
                                Text("Tasks")
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            VStack {
                                Image(systemName: "wand.and.stars")
                                Text("Customize")
                                Text("Space")
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            VStack {
                                Image(systemName: "arrow.uturn.backward.circle.fill")
                                Text("Restart")
                                Text("Activity")
                            }
                        }
                        Spacer()
                        
                        Button(action: {}) {
                            VStack {
                                Image(systemName: "clock.fill")
                                Text("Activity")
                                Text("History")
                            }
                        }
                    }
                    
                }
                .padding(.horizontal, 34)
                .padding(.vertical, 16)
            }
            
            Divider()
                .padding(.horizontal, 30)
            
            
        }
    }
}

struct WorkspaceScreenContent_Previews: PreviewProvider {
    static var previews: some View {
        WorkspaceScreenContent()
    }
}
