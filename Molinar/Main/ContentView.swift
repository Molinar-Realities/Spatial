//
//  ContentView.swift
//  Molinar
//
//  Created by Matt Molinar on 2/24/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                VStack {
                    Spacer()
                    Text("Hello world")
                    Spacer()
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
    }
}
