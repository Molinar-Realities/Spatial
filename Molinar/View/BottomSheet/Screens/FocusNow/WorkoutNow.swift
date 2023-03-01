//
//  WorkoutNow.swift
//  Molinar
//
//  Created by Matt Molinar on 3/1/23.
//

import SwiftUI

struct WorkoutNow: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Rectangle()
                    .frame(width: 38, height: 38)
                    .cornerRadius(5)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Today's Workout")
                        .foregroundColor(.gray)
                        .font(.footnote)
                    Text("Back Squat 8x5")
                        .font(.headline)

                }
                Spacer()
            }
            Rectangle()
                .frame(height: 170)
                .cornerRadius(10)
        }
    }
}

struct WorkoutNow_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutNow()
    }
}
