//
//  FriendView.swift
//  Molinar
//
//  Created by Matt Molinar on 2/21/23.
//

import SwiftUI

struct FriendView: View {
    @EnvironmentObject var bottomSheetViewModel: BottomSheetViewModel
    @Binding var presentingEventDetailSheet: Bool

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                MapboxRepresentable().environmentObject(MapboxViewModel.shared)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    
                    FilterLabels()
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

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView(presentingEventDetailSheet: .constant(false))
    }
}
