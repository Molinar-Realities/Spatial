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
