//
//  ScheduleHeadline.swift
//  Molinar
//
//  Created by Matt Molinar on 2/11/23.
//

import SwiftUI

struct ScheduleHeadline: View {
    var body: some View {
        HStack {
            Text("Based on your schedule")
                .font(.title3)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding(.bottom)
    }
}

struct ScheduleHeadline_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleHeadline()
    }
}
