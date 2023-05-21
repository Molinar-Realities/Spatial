//
//  ProfileView.swift
//  Molinar
//
//  Created by Matt Molinar on 3/2/23.
//

import SwiftUI

struct ProfileView: View {
    private let user: User
    @ObservedObject private var viewModel: ProfileViewModel
    @Binding var showSheet: Bool
    @State var selectedFilter: FilterOptionsProfile = .activity
    
    init(user: User, showSheet: Binding<Bool>) {
          self.user = user
          self.viewModel = ProfileViewModel(user: user)
          self._showSheet = showSheet
      }

    var body: some View {
        VStack {
            ProfileHeaderView(viewModel: viewModel, showSheet: $showSheet)
            ProfileActionButtonView(isCurrentUser: viewModel.user.isCurrentUser, profileViewModel: viewModel)
            FilterButtonView(selectedOption: $selectedFilter)
            
            ScrollView {
                if selectedFilter == .activity {
                    if viewModel.userActivity.count > 0 {
                        Text("Lots of activity")
                    } else {
                        HStack {
                            VStack(alignment: .leading) {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Text("\(user.name) doesn't have any activity :(")
                                        .padding(.bottom, 25)
                                    Spacer()
                                }
                                Spacer()
                            }.padding()
                            Spacer()
                        }
                    }
                } else {
                    if viewModel.userItems.count > 0 {
                        Text("Lots of items")
                    } else {
                        HStack {
                            VStack(alignment: .leading) {
                                Spacer()
                                HStack {
                                    Spacer()
                                    Text("\(user.name) doesn't have any items :(")
                                        .padding(.bottom, 25)
                                    Spacer()
                                }
                                Spacer()
                            }.padding()
                            Spacer()
                        }
                    }
                }
            }
            
        }
    }
}

