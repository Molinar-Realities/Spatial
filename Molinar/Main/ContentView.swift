//
//  ContentView.swift
//  Molinar
//
//  Created by Matt Molinar on 2/24/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var bottomSheetViewModel: BottomSheetViewModel
    @State var selectedIndex = 0
    @State var presentSheet = false
    @State private var scrollPosition: CGFloat = 0
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ZStack {
                    Spacer().fullScreenCover(isPresented: $presentSheet) {
                        NavigationView {
                            RecommendedSheetView(presented: $presentSheet, selectedIndex: $selectedIndex)

                        }
                    }
                    Spacer().fullScreenCover(isPresented: $bottomSheetViewModel.showAddTaskSheet) {
                        AddTaskSheet(viewModel: UploadTaskViewModel(), showAddTaskSheet: $bottomSheetViewModel.showAddTaskSheet)
                    }
                    TabView(selection: $selectedIndex) {
                        NowView(presentingEventDetailSheet: $presentSheet, scrollPosition: $scrollPosition).environmentObject(BottomSheetViewModel.shared)
                            .onTapGesture {
                                                self.selectedIndex = 0
                                            }
                            .tabItem {
                                Label("Focus Now", systemImage: "globe.americas.fill")
                            }
                            .tag(0)
                        
                        NowView(presentingEventDetailSheet: $presentSheet, scrollPosition: $scrollPosition).environmentObject(BottomSheetViewModel.shared)
                            .onTapGesture {
                                                self.selectedIndex = 1
                                viewModel.signOut()
                                            }
                            .environmentObject(BottomSheetViewModel.shared)
                            .tabItem {
                                Image("TabMiddleIcon")
                                    .resizable()
                                    
                            }
                            .tag(1)
                        
                        FriendView(presentingEventDetailSheet: $presentSheet)
                            .environmentObject(BottomSheetViewModel.shared )
                            .tabItem {
                                Label("Friends", systemImage: "figure.2.arms.open")
                            }
                            .tag(2)
                        
                        
                        
                    }
                    .onChange(of: selectedIndex) { value in
                        if self.selectedIndex == 1 {
                            presentSheet.toggle()
                            
                        }
                            }
                }
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AuthViewModel.shared)
            .environmentObject(BottomSheetViewModel())
    }
}
