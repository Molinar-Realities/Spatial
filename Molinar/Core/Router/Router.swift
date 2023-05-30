//
//  ContentView.swift
//  Molinar
//
//  Created by Matt Molinar on 2/24/23.
//



import Dispatch
import SwiftUI
import BottomSheet

struct Router: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var bottomSheetViewModel: BottomSheetViewModel
    @EnvironmentObject var tasksViewModel: TasksViewModel
    @EnvironmentObject var projectsViewModel: ProjectsViewModel
    
    @State var showingTabView = true

    @State var selectedIndex = 0
    @State var presentSheet = false
    @State private var scrollPosition: CGFloat = 0
    @State var bottomSheetPosition: BottomSheetPosition = .relative(0.50)
    @State var searchText: String = ""
    @State private var isShowingTaskSheet = false
    @State private var sheetText = ""
    @State var taskTitle = ""
    @State private var currentPresentationDetent: PresentationDetent = .height(140)
    @State var presentationDetents: [PresentationDetent] = [.height(140)]
    @State var shouldShowDragIndicator = true
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

    let icons = ["magnifyingglass.circle","play.circle", "plus.app", "person.2", "bubble.left" ]

    var body: some View {
        Group {
            // outer Router
            if viewModel.userSession != nil {
                // world view
                WorldView()
                .environmentObject(viewModel)
                .environmentObject(BottomSheetViewModel())
                .environmentObject(TasksViewModel())
                .environmentObject(ProjectsViewModel())

            } else {
                LoginView()
            }
            // immersive mode
            
            // messaging mode
            
            
        }
    }
    
}


