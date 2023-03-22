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
    @EnvironmentObject var projectsViewModel: ProjectsViewModel
    
    @State var showingTabView = true

    @State var selectedIndex = 0
    @State var presentSheet = false
    @State private var scrollPosition: CGFloat = 0
    @State var bottomSheetPosition: BottomSheetPosition = .relative(0.4)
    @State var searchText: String = ""
    @State private var isShowingTaskSheet = false
    @State private var sheetText = ""
    @State var taskTitle = ""
    @State private var currentPresentationDetent: PresentationDetent = .height(140)
    @State var presentationDetents: [PresentationDetent] = [.height(170)]
    @State var shouldShowDragIndicator = true
    @State var showingTaskDetail = false
    @State var selectedFilter: TaskFilterOptions = .today
    @State var selectedFeed: FeedFilterOptions = .home
    
    let fakeData = ["email": "fake@email.com",
                    "username": "error",
                    "name": "error",
                    "profileImageUrl": "error",
                    "uid": "error"]
    
    enum FocusField: Hashable {
        case title
      }
    
    @FocusState private var taskNameInFocus: Bool

    let icons = ["house", "plus.app.fill", "bubble.left"]

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
                                }
                            }
                            .bottomSheet(bottomSheetPosition: $bottomSheetPosition, switchablePositions: showingTaskDetail ? [.relative(0.4)] : [.relativeBottom(0.125), .relative(0.4), .relativeTop(1.00)], headerContent: {
                                switch selectedIndex {
                                case 0:
                                    if !shouldShowDragIndicator {
//                                        withAnimation(.spring()) {
                                        VStack {
                                            AppHeader(user: AuthViewModel.shared.user ?? User(dictionary: fakeData))
                                            TaskFilterButtons(selectedOption: $selectedFilter)
                                        }
//                                        }
                                    } else {
                                        if !showingTaskDetail {
                                            if selectedFeed == .home {
                                                HStack {
                                                    Image(systemName: "magnifyingglass")
                                                    TextField("Search", text: self.$searchText)
                                                }
                                                .foregroundColor(Color(UIColor.secondaryLabel))
                                                .padding(.vertical, 8)
                                                .padding(.horizontal, 5)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.quaternaryLabel)))
                                                .padding([.horizontal, .bottom])
                                                //When you tap the SearchBar, the BottomSheet moves to the .top position to make room for the keyboard.
                                                .onTapGesture {
                                                    self.bottomSheetPosition = .relativeTop(0.97)
                                                }
                                            } else if selectedFeed == .tasks {
                                                TaskFilterButtons(selectedOption: $selectedFilter)
                                            } else if selectedFeed == .posts {
                                                Text("World News")
                                                    .font(.headline)
                                                    .fontWeight(.bold)
                                                    .padding(.horizontal)
                                            }
                                        
                                              
                            
                                        } else {
                                            DetailTaskHeader(showTabs: $showingTabView, showTaskDetail: $showingTaskDetail)
                                        }
                                    }
                                case 1:
                                    //A SearchBar as headerContent.
                                    if !shouldShowDragIndicator {
                                        VStack {
                                            AppHeader(user: AuthViewModel.shared.user ?? User(dictionary: fakeData))

                                            HStack {
                                                Image(systemName: "magnifyingglass")
                                                TextField("Search", text: self.$searchText)
                                            }
                                            .foregroundColor(Color(UIColor.secondaryLabel))
                                            .padding(.vertical, 8)
                                            .padding(.horizontal, 5)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.quaternaryLabel)))
                                            .padding([.horizontal, .bottom])
                                            //When you tap the SearchBar, the BottomSheet moves to the .top position to make room for the keyboard.
                                            .onTapGesture {
                                                self.bottomSheetPosition = .relativeTop(1.00)
                                            }
                                        }
                                    } else {
                                        HStack {
                                            Image(systemName: "magnifyingglass")
                                            TextField("Search", text: self.$searchText)
                                        }
                                        .foregroundColor(Color(UIColor.secondaryLabel))
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 5)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.quaternaryLabel)))
                                        .padding([.horizontal, .bottom])
                                        //When you tap the SearchBar, the BottomSheet moves to the .top position to make room for the keyboard.
                                        .onTapGesture {
                                            self.bottomSheetPosition = .relativeTop(1.00)
                                        }

                                    }
                                    
                                case 2:
                                    if !shouldShowDragIndicator {
//                                        withAnimation(.spring()) {
                                            AppHeader(user: AuthViewModel.shared.user ?? User(dictionary: fakeData))
//                                        }
                                    } else {
                                        if !showingTaskDetail {
                                            EmptyView()
                                        } else {
                                            DetailTaskHeader(showTabs: $showingTabView, showTaskDetail: $showingTaskDetail)
                                        }
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
                                            if !showingTaskDetail {
                                                // filter feed view
                                                if selectedFeed == .home {
                                                    ForYou()
                                                } else if selectedFeed == .tasks {
                                                    TaskFocusNow(bottomSheetPosition: $bottomSheetPosition, showTaskDetail: $showingTaskDetail, showAddTask: $isShowingTaskSheet, showTabs: $showingTabView, selectedFilter: $selectedFilter)
                                                        .environmentObject(tasksViewModel)
                                                    .edgesIgnoringSafeArea(.all)
                                                } else if selectedFeed == .events {
                                                    TaskFocusNow(bottomSheetPosition: $bottomSheetPosition, showTaskDetail: $showingTaskDetail, showAddTask: $isShowingTaskSheet, showTabs: $showingTabView, selectedFilter: $selectedFilter)
                                                        .environmentObject(tasksViewModel)
                                                    .edgesIgnoringSafeArea(.all)
                                                }
                                                
                                            } else {
                                                DetailTask()
                                            }
                                        }
                                    }
                                    
                                case 1:
                                    VStack(alignment: .leading) {
                                        Text("Try searching for people, events, or your own tasks.")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                        Spacer()
                                    }
                                    
                                
                                case 3:
                                    VStack {
                                        Text("Friends")
                                    }
                                    
                                case 4:
                                    FriendsBottomTab(searchText: $searchText, bottomSheetPosition: $bottomSheetPosition)
                                        .edgesIgnoringSafeArea(.all)

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
                // Add Task Sheet
                .sheet(isPresented: $isShowingTaskSheet, onDismiss: {
                            // Do something when the sheet is dismissed
                    presentationDetents = [.height(170)]
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










