//
//  FilterLabels.swift
//  Molinar
//
//  Created by Matt Molinar on 2/11/23.
//

import SwiftUI

struct FilterLabels: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(0..<4) { index in
                    Button(action: {
                        // Perform an action here when the button is tapped
                    }) {
                        Image(["AutoPilotLabel", "MolinarTasksLabel", "MolinarFitnessLabel", "MolinarEnergyLabel"][index])
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                   
                    

                }
            }
            .padding()
        }


    }
}

struct FilterLabels_Previews: PreviewProvider {
    static var previews: some View {
        FilterLabels()
    }
}
