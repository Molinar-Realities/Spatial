//
//  WorkspaceView.swift
//  Molinar
//
//  Created by Matt Molinar on 2/12/23.
//

import SwiftUI

struct WorkspaceView: View {
    @EnvironmentObject var bottomSheetViewModel: BottomSheetViewModel
    @Environment(\.presentationMode) var presentationMode
    @Binding var sheetPresented: Bool


    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("WorkspaceWallpaper")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
//                RoundedRectangle(cornerRadius: 15)
//                    .frame(width: 200, height: 100)
                
                VStack {
                    HStack {
                        Button(action: {
                            sheetPresented.toggle()
                            self.presentationMode.wrappedValue.dismiss()

                        }) {
                            Image(systemName: "x.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.red)
                        }
                        Spacer()
                    }
                    .padding()
                    Spacer()
                    
                    BottomSheet(searchText: $bottomSheetViewModel.searchText, content: {
                        WorkspaceScreenContent()
                            .padding(.bottom, 28)
                    }, offset: $bottomSheetViewModel.bottomSheetOffset)
                    .offset(y: geometry.frame(in: .global).height - 700)
                    .offset(y: bottomSheetViewModel.bottomSheetOffset)
//                    .overlay {
//                        RoundedRectangle(cornerRadius: 20)
//                            .offset(y: 300)
//                    }
                }

                
            }
            .navigationBarHidden(true)

        }

      
    }
}

struct WorkspaceView_Previews: PreviewProvider {
    static var previews: some View {
        WorkspaceView( sheetPresented: .constant(true)).environmentObject(BottomSheetViewModel())
    }
}
