//
//  ContentView.swift
//  Molinar
//
//  Created by Matt Molinar on 2/24/23.
//
import Dispatch
import SwiftUI
import BottomSheet

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var bottomSheetViewModel: BottomSheetViewModel
    @EnvironmentObject var tasksViewModel: TasksViewModel

    @State var selectedIndex = 0
    @State var presentSheet = false
    @State private var scrollPosition: CGFloat = 0
    @State var bottomSheetPosition: BottomSheetPosition = .relative(0.4)
    @State var searchText: String = ""
    @State private var isShowingTaskSheet = false
    @State private var sheetText = ""
    @State var taskTitle = ""
    @State private var currentPresentationDetent: PresentationDetent = .height(140)
    @State var presentationDetents: [PresentationDetent] = [.height(140)]
    @State var shouldShowDragIndicator = true
    
    let fakeData = ["email": "fake@email.com",
                    "username": "error",
                    "name": "error",
                    "profileImageUrl": "error",
                    "uid": "error"]
    
    enum FocusField: Hashable {
        case title
      }
    
    @FocusState private var taskNameInFocus: Bool

    let icons = ["globe.americas.fill", "plus.app.fill", "figure.2.arms.open" ]

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                VStack(spacing: 0) {

                    // BEGIN
                    ZStack {
                        MapboxRepresentable().environmentObject(MapboxViewModel.shared)
                            .edgesIgnoringSafeArea(.all)
                            .overlay(alignment: .top) {
                                VStack(spacing: 0) {
                                    AppHeader(user: AuthViewModel.shared.user ?? User(dictionary: fakeData))
                                    FilterScrollView()
                                }
                            }
                            .bottomSheet(bottomSheetPosition: $bottomSheetPosition, switchablePositions: [.relativeBottom(0.125), .relative(0.4), .relativeTop(1.00)], headerContent: {
                                switch selectedIndex {
                                case 0:
                                    if !shouldShowDragIndicator {
//                                        withAnimation(.spring()) {
                                            AppHeader(user: AuthViewModel.shared.user ?? User(dictionary: fakeData))
//                                        }
                                    } else {
                                        Text("Focus Now")
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .padding(.horizontal)
                                    }
                                    
                                case 1:
                                    
                                    Text("Create")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .padding(.horizontal)
                                case 2:
                                    if !shouldShowDragIndicator {
//                                        withAnimation(.spring()) {
                                            AppHeader(user: AuthViewModel.shared.user ?? User(dictionary: fakeData))
//                                        }
                                    } else {
                                        VStack {
                                            HStack {
                                                Text("Friends")
                                                    .font(.largeTitle)
                                                    .fontWeight(.bold)
                                                .padding(.horizontal)
                                                Spacer()
                                                
                                                Button(action: {}) {
                                                    Image(systemName: "plus.circle.fill")
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 38, height: 38)
                                                        .padding(.horizontal)
                                                    .foregroundColor(.blue)
                                                }
                                            }
                                            
                                        }
                                    }
                                    
                                default:
                                    Text("Focus Now")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                        .padding(.horizontal)
                                }
                                
                            }) {
                                
                                switch selectedIndex {
                                case 0:
                                    TaskFocusNow()
                                        .environmentObject(tasksViewModel)
                                case 2:
                                    FriendsBottomTab(searchText: $searchText, bottomSheetPosition: $bottomSheetPosition)
                                default:
                                    Text("")
                                }
                                
                            }
                            .showDragIndicator(shouldShowDragIndicator)
                            .enableAppleScrollBehavior()
                            .customBackground(.white)
                            .onChange(of: bottomSheetPosition) { position in
                                shouldShowDragIndicator = position != .relativeTop(1.0)
                                        }
                           


                    }
                    Divider()
                    HStack {
                        ForEach(0..<3, id: \.self) { number in
                            Spacer()
                            Button(action: {
                                if number == 1 {
                                    isShowingTaskSheet.toggle()
                                    
                                    // Generate haptic feedback
                                    let generator = UIImpactFeedbackGenerator(style: .light)
                                    generator.prepare()
                                    generator.impactOccurred()
                                    
                                } else {
                                    self.selectedIndex = number

                                }
                            }) {
                                Image(systemName: icons[number])
                                    .font(.system(size: 25))
                                    .foregroundColor(selectedIndex == number ? .blue : Color(UIColor.white))

                            }
                            .sheet(isPresented: $isShowingTaskSheet, onDismiss: {
                                        // Do something when the sheet is dismissed
                                presentationDetents = [.height(140)]
                                    }) {
                                        
                                        TaskSheet(showingSheet: $isShowingTaskSheet, presentationDetents: $presentationDetents)
                                            .presentationDetents(Set<PresentationDetent>(presentationDetents))
                                        
                                    }
                            
                           
                            
                                    
                                    
                            Spacer()
                        }
                    }
                    .padding(.top, 4)
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




