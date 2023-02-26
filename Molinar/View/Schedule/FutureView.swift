//
//  FutureView.swift
//  Molinar
//
//  Created by Matt Molinar on 2/11/23.
//

import SwiftUI

struct FutureView: View {
    @EnvironmentObject var bottomSheetViewModel: BottomSheetViewModel
    @State var showAddTaskSheet = false
    @Binding var scrollPosition: CGFloat


    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                MapboxRepresentable().environmentObject(MapboxViewModel.shared)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    
                    MapboxViewModel.shared.filterButtons
                    HStack {
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "location.circle")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.white)
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    BottomSheet(searchText: $bottomSheetViewModel.searchText, content: {
                        VStack {
                            HStack {
                                Text("Schedule")
                                    .font(.title3)
                               
                                Spacer()
                                
                            }
                            .padding(.horizontal)
                            .padding(.top)
                            .padding(.bottom, -4)
                            ScrollView(.vertical, showsIndicators: false) {
                                
                                VStack {
                                    ForEach(0 ..< 20) { index in
                                        VStack(alignment: .leading, spacing: 16.0) {
                                            Image("workout2")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.frame(in: .global).width * 0.90, height: 150)
                                            CardText()
                                                .padding(.horizontal, 8)
                                                .background(Color.white)
                                        }
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .shadow(radius: 3)
                                        .padding(.vertical)
                                    }
                                }
                                
                                
                                
                                
                                
                                
                            }
                            .padding()
                        }
                    }, offset: $bottomSheetViewModel.bottomSheetOffset)
//                    .overlay {
//                        // this has already been lined up to be above the bottom sheet.
//                        ChatBubble()
//                    }
                    // this controls everything in the bottom sheet.
                    .offset(y: geometry.frame(in: .global).height - geometry.frame(in: .global).height * 0.65)
                    .offset(y: bottomSheetViewModel.bottomSheetOffset)
                    // gesture
                    .gesture(DragGesture().onChanged({ (value) in
                        withAnimation{
                            // checking the direction of scroll
                            
                            // scrolling upwards
                            // using startLocation bc translation will change when we drag up and down.
                            if value.startLocation.y > geometry.frame(in: .global).midX{
                                
                                if value.translation.height < 0 && bottomSheetViewModel.bottomSheetOffset > (-geometry.frame(in: .global).height + geometry.frame(in: .global).height * 0.65){
                                    bottomSheetViewModel.bottomSheetOffset = value.translation.height
                                }
                                
                            }
                            
                            if value.startLocation.y < geometry.frame(in: .global).midX{
                                
                                if value.translation.height > 0  && bottomSheetViewModel.bottomSheetOffset > 0 {
                                    bottomSheetViewModel.bottomSheetOffset = (-geometry.frame(in: .global).height + geometry.frame(in: .global).height * 0.65) + value.translation.height
                                }
                            }
                        }
                    }).onEnded({ (value) in
                        withAnimation{
                            // checking and pulling up the screen...
                            
                            if value.startLocation.y > geometry.frame(in: .global).midX{
                                
                                if -value.translation.height > geometry.frame(in: .global).midX{
                                    bottomSheetViewModel.bottomSheetOffset = (-geometry.frame(in: .global).height + geometry.frame(in: .global).height * 0.65)
                                    
                                    return
                                }
                                
                                bottomSheetViewModel.bottomSheetOffset = 0
                            }
                            
                            if value.startLocation.y < geometry.frame(in: .global).midX{
                                if value.translation.height < geometry.frame(in: .global).midX{
                                    bottomSheetViewModel.bottomSheetOffset = (-geometry.frame(in: .global).height + geometry.frame(in: .global).height * 0.65)
                                    
                                    return
                                }
                                
                                bottomSheetViewModel.bottomSheetOffset = 0
                            }
                            
                            
                        }
                    }))
                    
                }
                
            }
        }
    }
}

struct FutureView_Previews: PreviewProvider {
    static var previews: some View {
        FutureView(scrollPosition: .constant(0))
    }
}



struct CardText: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Morning Workout")
                    .font(.headline)
                HStack {
                    Image(systemName: "clock.arrow.circlepath")
                    Text("5:00am - 6:00am")
                }.foregroundColor(.gray)
                Text("Gregory Gym")
                    .foregroundColor(.blue)
                    .padding(.bottom, 16)
                    
                
                
            }
            Spacer()
        }
    }
}
