//
//  NowView.swift
//  Molinar
//
//  Created by Matt Molinar on 2/11/23.
//

import SwiftUI

struct NowView: View {
    @EnvironmentObject var bottomSheetViewModel: BottomSheetViewModel
    @Binding var presentingEventDetailSheet: Bool
    @Binding var scrollPosition: CGFloat


    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                MapboxRepresentable().environmentObject(MapboxViewModel.shared)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    AppHeader()
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
                        FocusNow()
                    }, offset: $bottomSheetViewModel.bottomSheetOffset)
                    
                    // this controls everything in the bottom sheet.
                    
                    // WE WILL MAKE THIS DRY SOON...
                    
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

struct NowView_Previews: PreviewProvider {
    static var previews: some View {
        NowView(presentingEventDetailSheet: .constant(false), scrollPosition: .constant(0))
    }
}
