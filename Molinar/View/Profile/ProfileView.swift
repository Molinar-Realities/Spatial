//
//  ProfileView.swift
//  Molinar
//
//  Created by Matt Molinar on 3/2/23.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        VStack {
            ProfileHeaderView(viewModel: viewModel)
        }
    }
}

