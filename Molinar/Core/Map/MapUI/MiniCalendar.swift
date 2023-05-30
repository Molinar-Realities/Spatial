//
//  MiniCalendar.swift
//  Molinar
//
//  Created by Matt Molinar on 3/1/23.
//

import SwiftUI

struct MiniCalendar: View {
    @Namespace private var animation
    @State private var eventsHeight: CGFloat = 0


    @State var showingEvents = false
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            // calendar header
            HStack {
                Text("Calendar")
                    .foregroundColor(Color("TrustBlue"))
                    .font(.subheadline)
                
                Spacer()
                Button(action:{
                    showingEvents.toggle()
                    eventsHeight = showingEvents ? 80 : 0 // set the height based on the desired size of the events section
                }) {
                    Image(systemName: showingEvents ? "chevron.up" : "chevron.down")
                        .foregroundColor(Color(.systemGray))
                        .fontWeight(.bold)
                }
            }
            .frame(width: 108)
            .padding(.top, 8)
            .padding(.horizontal, 16)
            .onTapGesture {
                showingEvents.toggle()
                eventsHeight = showingEvents ? 80 : 0 // set the height based on the desired size of the events section
            }
            
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
                    HStack {
                            Text("3 more...")
                            .font(.caption2)
                            .foregroundColor(.gray)
                            .padding(.bottom, 4)
                        Spacer()
                        
                    }
                    .frame(width: 100)
                }
                .opacity(showingEvents ? 1 : 0)
                .padding(.top, 4) // idk
                .padding(.horizontal, 8)
                .frame(height: eventsHeight)

            
            
            
            
        }
        .background(.white)
        .cornerRadius(20)
        .animation(.easeInOut(duration: 0.3), value: eventsHeight) // add the animation modifier

        
    }
}

struct MiniCalendar_Previews: PreviewProvider {
    static var previews: some View {
        MiniCalendar()
    }
}
