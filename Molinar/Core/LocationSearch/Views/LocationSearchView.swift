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
    
    var body: some View {
        VStack {
            TextField("Where at?", text: $viewModel.queryFragment)
                .padding(.horizontal)
                .padding(.top, 64)
            Divider()
                .padding(.vertical)
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.results, id: \.self) { result in
                        LocationSearchResultCell(title: result.title, subtitle: result.subtitle)
                        
                    }
                }
            }
            
        }
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView()
    }
}
