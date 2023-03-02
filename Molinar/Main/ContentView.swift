//
//  ContentView.swift
//  Molinar
//
//  Created by Matt Molinar on 2/24/23.
//

import SwiftUI
import BottomSheet

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var bottomSheetViewModel: BottomSheetViewModel
    @State var selectedIndex = 0
    @State var presentSheet = false
    @State private var scrollPosition: CGFloat = 0
    @State var bottomSheetPosition: BottomSheetPosition = .relative(0.4)
    
    let icons = ["globe.americas.fill", "plus.circle.fill", "figure.2.arms.open" ]

    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                VStack(spacing: 0) {
                    AppHeader()

//                    Spacer().fullScreenCover(isPresented: $presentSheet) {
//                        NavigationView {
//                            RecommendedSheetView(presented: $presentSheet, selectedIndex: $selectedIndex)
//
//                        }
//                    }

//                    }
//                    TabView(selection: $selectedIndex) {
//                        NowView(presentingEventDetailSheet: $presentSheet, scrollPosition: $scrollPosition).environmentObject(BottomSheetViewModel.shared)
//
//                            .onTapGesture {
//                                                self.selectedIndex = 0
//                                            }
//                            .tabItem {
//                                Label("Focus Now", systemImage: "globe.americas.fill")
//                            }
//
//                            .tag(0)
//
//
//
//
//                        NowView(presentingEventDetailSheet: $presentSheet, scrollPosition: $scrollPosition
//                        ).environmentObject(BottomSheetViewModel.shared)
//
//
//                            .onTapGesture {
//                                                self.selectedIndex = 1
//                                viewModel.signOut()
//                                            }
//                            .environmentObject(BottomSheetViewModel.shared)
//                            .tabItem {
//                                Image("TabMiddleIcon")
//                                    .resizable()
//
//                            }
//                            .tag(1)
//
//
//
//                        FriendView(presentingEventDetailSheet: $presentSheet)
//                            .environmentObject(BottomSheetViewModel.shared )
//                            .tabItem {
//                                Label("Friends", systemImage: "figure.2.arms.open")
//                            }
//                            .tag(2)
//
//
//
//                    }
//
//                    .onChange(of: selectedIndex) { value in
//                        if self.selectedIndex == 1 {
//                            presentSheet.toggle()
//
//                        }
//                            }
                    
                    // BEGIN
                    ZStack {
                        Spacer()
                            .fullScreenCover(isPresented: $presentSheet) {
                                AddTaskSheet( viewModel: UploadTaskViewModel(), showAddTaskSheet: $presentSheet)
                                
                            }
                        MapboxRepresentable().environmentObject(MapboxViewModel.shared)
                            .edgesIgnoringSafeArea(.all)
                            .bottomSheet(bottomSheetPosition: $bottomSheetPosition, switchablePositions: [.relativeBottom(0.125), .relative(0.4), .relativeTop(0.975)], headerContent: {
                                switch selectedIndex {
                                case 0:
                                    Text("Focus Now")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .padding(.horizontal)
                                case 1:
                                    Text("Create")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .padding(.horizontal)
                                case 2:
                                    Text("Friends")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .padding(.horizontal)
                                default:
                                    Text("Focus Now")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .padding(.horizontal)
                                }
                                
                            }) {
                                
                                switch selectedIndex {
                                case 0:
                                    FocusNow()
                                default:
                                    Text("")
                                }
                                
                            }
                            .enableAppleScrollBehavior()
                            .customBackground(
                                Color.white
                            )


                    }
                    Divider()
                    HStack {
                        ForEach(0..<3, id: \.self) { number in
                            Spacer()
                            Button(action: {
                                if number == 1 {
                                    presentSheet.toggle()
                                } else {
                                    self.selectedIndex = number

                                }
                            }) {
                                Image(systemName: icons[number])
                                    .font(.system(size: 25))
                                    .foregroundColor(selectedIndex == number ? .blue : Color(UIColor.white))

                            }
                            Spacer()
                        }
                    }
                    .background(.black)
                    
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
