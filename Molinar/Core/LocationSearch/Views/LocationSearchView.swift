//
//  LocationSearchView.swift
//  Molinar
//
//  Created by Matt Molinar on 3/2/23.
//

import SwiftUI

struct LocationSearchView: View {
    @State var taskLocationText = ""
    @StateObject var viewModel = LocationSearchViewModel()
    @FocusState private var locationFieldInFocus: Bool
    @Binding var showLocationSearch: Bool

    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                withAnimation(.spring()) {
                    showLocationSearch.toggle()
                }
            }) {
                Text("Cancel")
            }
            .padding()
            TextField("Where at?", text: $viewModel.queryFragment)
                .focused($locationFieldInFocus)
                .padding(.horizontal)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        print("DEBUG: Async ran.")
                        locationFieldInFocus = true
                  }
                }
            Divider()
                .padding(.vertical)
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.results, id: \.self) { result in
                        LocationSearchResultCell(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                // Generate haptic feedback
                                viewModel.selectLocation(result.title)
                                let generator = UIImpactFeedbackGenerator(style: .light)
                                generator.prepare()
                                generator.impactOccurred()
                                showLocationSearch.toggle()
                            }
                        
                    }
                }
            }
            
        }
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(showLocationSearch: .constant(true))
    }
}
