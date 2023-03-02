//
//  MiniCalendar.swift
//  Molinar
//
//  Created by Matt Molinar on 3/1/23.
//

import SwiftUI

struct MiniCalendar: View {
    @State var showingEvents = false
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            // calendar header
            HStack {
                Text("Calendar")
                    .font(.headline)
                Spacer()
                Button(action:{
                    showingEvents.toggle()
                }) {
                    Image(systemName: showingEvents ? "chevron.down" : "chevron.right")
                        .foregroundColor(Color(.systemGray))
                        .fontWeight(.bold)
                }
            }
            .frame(width: 108)
            .padding(.top, 8)
            .padding(.horizontal, 8)
            
            if showingEvents {
                VStack(spacing: 2) {
                    ForEach(0 ..< 2) { item in
                        HStack(spacing: 5) {
                            Rectangle()
                                .frame(width: 2, height: 24)
                            VStack(alignment: .leading) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("Thermo Lecture")
                                            .font(.system(size: 10))
                                            .foregroundColor(.white)
                                        
                                        Text("9:00-11:00AM")
                                            .font(.system(size: 8))
                                            .fontWeight(.light)
                                            .foregroundColor(.white)

                                    }
                                    .padding(.leading, 4)
                                    Spacer()
                                    Image(systemName: "calendar")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 14, height: 14)
                                        .foregroundColor(.white)
                                    Spacer()
                                    
                                }
                            }
                            .frame(width: 108, height: 24)
                            .background(RoundedRectangle(cornerRadius: 2).fill(Color(UIColor.systemGray)))
                            
                        }
                    }
                }
                .padding(.top, 8)
            .padding(.horizontal, 8)
            } else {
                EmptyView()
            }
            
            VStack {
                if showingEvents {
                    Text("3 more...")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 8)
                .padding(.bottom, 4)
                } else {
                    EmptyView()
                }
            }
            
        }
        .background(.white)
        .cornerRadius(10)
        
    }
}

struct MiniCalendar_Previews: PreviewProvider {
    static var previews: some View {
        MiniCalendar()
    }
}
