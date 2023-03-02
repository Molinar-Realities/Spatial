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
    
    init(user: User, showSheet: Binding<Bool>) {
          self.user = user
          self.viewModel = ProfileViewModel(user: user)
          self._showSheet = showSheet
      }

    var body: some View {
        VStack {
            ProfileHeaderView(viewModel: viewModel, showSheet: $showSheet)
        }
    }
}

