//
//  WorldView.swift
//

import SwiftUI
import BottomSheet

struct EarthView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var bottomSheetViewModel: BottomSheetViewModel
    @EnvironmentObject var tasksViewModel: TasksViewModel
    @EnvironmentObject var projectsViewModel: ProjectsViewModel
    
    @State var showingTabView = true
    @State var selectedIndex = 0
    @State var presentSheet = false
    @State private var scrollPosition: CGFloat = 0
    @State var bottomSheetPosition: BottomSheetPosition = .relative(1.00)
    @State var searchText: String = ""
    @State private var isShowingTaskSheet = false
    @State private var sheetText = ""
    @State var taskTitle = ""
    @State private var currentPresentationDetent: PresentationDetent = .height(140)
    @State var presentationDetents: [PresentationDetent] = [.height(140)]
    @State var shouldShowDragIndicator = false
    @State var showingTaskDetail = false
    @State var selectedFilter: TaskFilterOptions = .today
    @State var selectedFeed: FeedFilterOptions = .tasks

    let fakeData = ["email": "fake@email.com",
                    "username": "error",
                    "name": "error",
                    "profileImageUrl": "error",
                    "uid": "error"]
    
    enum FocusField: Hashable {
        case title
      }
    
    @FocusState private var taskNameInFocus: Bool

    let icons = ["checkmark.circle", "plus.app", "calendar.circle" ]

    var body: some View {
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
                            AppHeader(user: AuthViewModel.shared.user ?? User(dictionary: fakeData),
                                      bottomSheetPosition: $bottomSheetPosition
                            )
//                            FilterScrollView(selectedFeed: $selectedFeed)
                        }
                    }
                    .bottomSheet(bottomSheetPosition: $bottomSheetPosition, switchablePositions: showingTaskDetail ? [.relative(0.4)] : [.relativeBottom(0.1), .relative(0.50), .relativeTop(1.00)], headerContent: {
                        switch selectedIndex {
                        case 0:
                            if !shouldShowDragIndicator {
//                                        withAnimation(.spring()) {
                                VStack {
                                    AppHeader(user: AuthViewModel.shared.user ?? User(dictionary: fakeData),
                                              bottomSheetPosition: $bottomSheetPosition
                                    )
//                                    FilterScrollView(selectedFeed: $selectedFeed)
                                }
                            } else {
                                if !showingTaskDetail {
                                    FocusNowHeader()
                                } else {
                                    DetailTaskHeader(showTabs: $showingTabView, showTaskDetail: $showingTaskDetail)
                                }
                            }
                        case 2:
                            if !shouldShowDragIndicator {
//                                        withAnimation(.spring()) {
                                VStack {
                                    AppHeader(user: AuthViewModel.shared.user ?? User(dictionary: fakeData),
                                              bottomSheetPosition: $bottomSheetPosition
                                    )
//                                    FilterScrollView(selectedFeed: $selectedFeed)
                                }
                            } else {
                                if !showingTaskDetail {
                                    ExploreHeader()
                                } else {
                                    DetailTaskHeader(showTabs: $showingTabView, showTaskDetail: $showingTaskDetail)
                                }
                            }
                        case 3:
                            if !shouldShowDragIndicator {
//                                        withAnimation(.spring()) {
                                VStack {
                                    AppHeader(user: AuthViewModel.shared.user ?? User(dictionary: fakeData),
                                              bottomSheetPosition: $bottomSheetPosition
                                    )
//                                    FilterScrollView(selectedFeed: $selectedFeed)
                                }
                            } else {
                                if !showingTaskDetail {
                                    FriendsHeader()
                                } else {
                                    DetailTaskHeader(showTabs: $showingTabView, showTaskDetail: $showingTaskDetail)
                                }
                            }
                        case 4:
                            if !shouldShowDragIndicator {
//                                        withAnimation(.spring()) {
                                VStack {
                                    AppHeader(user: AuthViewModel.shared.user ?? User(dictionary: fakeData),
                                              bottomSheetPosition: $bottomSheetPosition
                                    )
//                                    FilterScrollView(selectedFeed: $selectedFeed)
                                }
                            } else {
                                if !showingTaskDetail {
                                    FriendsHeader()
                                } else {
                                    DetailTaskHeader(showTabs: $showingTabView, showTaskDetail: $showingTaskDetail)
                                }
                            }
                        default:
                            FocusNowHeader()
                        }
                    }) {
                        // THE MAIN CONTENT OF THE BOTTOM SHEET.
                        switch selectedIndex {
                        case 0:
                            Group {
                                if tasksViewModel.isLoading {
                                    ProgressView()
                                } else {
                                    if !showingTaskDetail {
                                        // filter feed view
                                        if selectedFeed == .home {
                                            ForYou()
                                        } else if selectedFeed == .tasks {
//                                            MovesView(bottomSheetPosition: $bottomSheetPosition, showTaskDetail: $showingTaskDetail, showAddTask: $isShowingTaskSheet, showTabs: $showingTabView, selectedFilter: $selectedFilter)
//                                                .environmentObject(tasksViewModel)
//                                            .edgesIgnoringSafeArea(.all)
                                            MovesHome()
                                        } else if selectedFeed == .events {
                                            MovesView(bottomSheetPosition: $bottomSheetPosition, showTaskDetail: $showingTaskDetail, showAddTask: $isShowingTaskSheet, showTabs: $showingTabView, selectedFilter: $selectedFilter)
                                                .environmentObject(tasksViewModel)
                                            .edgesIgnoringSafeArea(.all)
                                        }
                                    } else {
                                        DetailTask()
                                    }
                                }
                            }
                        case 2:
                            Group {
                                
                            }
                        default:
                            Text("")
                        }
                    }
                    .showDragIndicator(shouldShowDragIndicator)
                    .enableAppleScrollBehavior()
                    .customBackground(.white)
                    .dragIndicatorColor(Color(.systemGray3))
                    // Makes it so that when the bottom sheet is full position, the
                    // handle disappears for an immersive experience.
                    .onChange(of: bottomSheetPosition) { position in
                        shouldShowDragIndicator = position != .relativeTop(1.0)
                                }

            }
            // Our Tab View
            if showingTabView {
                Divider()
                HomeTabView(isShowingTaskSheet: $isShowingTaskSheet, selectedIndex: $selectedIndex, icons: icons, selectedFeed: $selectedFeed)
            } else {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width, height: 35)
            }
            
        }
        .sheet(isPresented: $isShowingTaskSheet, onDismiss: {
            // Do something when the sheet is dismissed
            presentationDetents = [.height(140)]
        }) {
            TaskSheet(showingSheet: $isShowingTaskSheet, presentationDetents: $presentationDetents)
                .presentationDetents(Set<PresentationDetent>(presentationDetents))
        }
    }
}

