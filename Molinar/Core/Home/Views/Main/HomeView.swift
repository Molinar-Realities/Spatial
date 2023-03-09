//
//  ContentView.swift
//  Molinar
//
//  Created by Matt Molinar on 2/24/23.
//
import Dispatch
import SwiftUI
import BottomSheet

struct HomeView: View {
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
                        // The main map itself!
                        MapboxRepresentable().environmentObject(MapboxViewModel.shared)
                            .environmentObject(tasksViewModel)
                            .edgesIgnoringSafeArea(.all)
                            // A hack to overlay the header due to ZStack
                            .overlay(alignment: .top) {
                                VStack(spacing: 0) {
                                    AppHeader(user: AuthViewModel.shared.user ?? User(dictionary: fakeData))
//                                    FilterScrollView()
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
                                        FocusNowHeader()
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
                                        FriendsHeader()
                                    }
                                default:
                                    FocusNowHeader()
                                }
                            }) {
                                switch selectedIndex {
                                case 0:
                                    Group {
                                        if tasksViewModel.isLoading {
                                            ProgressView()
                                        } else {
                                            TaskFocusNow(showAddTask: $isShowingTaskSheet)
                                                .environmentObject(tasksViewModel)
                                                .edgesIgnoringSafeArea(.all)
                                        }
                                    }
                                    
                                    
                                case 2:
                                    FriendsBottomTab(searchText: $searchText, bottomSheetPosition: $bottomSheetPosition)
                                        .edgesIgnoringSafeArea(.all)

                                default:
                                    Text("")
                                }
                            }
                            .showDragIndicator(shouldShowDragIndicator)
                            .enableAppleScrollBehavior()
                            .customBackground(.white)
                            // Makes it so that when the bottom sheet is full position, the
                            // handle disappears for an immersive experience.
                            .onChange(of: bottomSheetPosition) { position in
                                shouldShowDragIndicator = position != .relativeTop(1.0)
                                        }
                    }
                    Divider()
                    // Our Tab View
                    HomeTabView(isShowingTaskSheet: $isShowingTaskSheet, selectedIndex: $selectedIndex, icons: icons)
                    
                }
                // Add Task Sheet
                .sheet(isPresented: $isShowingTaskSheet, onDismiss: {
                            // Do something when the sheet is dismissed
                    presentationDetents = [.height(140)]
                        }) {
                            
                            TaskSheet(showingSheet: $isShowingTaskSheet, presentationDetents: $presentationDetents)
                                .presentationDetents(Set<PresentationDetent>(presentationDetents))
                            
                        }
                
            } else {
                LoginView()
            }
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(AuthViewModel.shared)
            .environmentObject(BottomSheetViewModel())
            .environmentObject(TasksViewModel())
    }
}










