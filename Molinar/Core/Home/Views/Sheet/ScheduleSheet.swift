//
//  ScheduleSheet.swift
//  Molinar
//
//  Created by Matt Molinar on 3/2/23.
//

import SwiftUI

struct ScheduleSheet: View {
    @Binding var deadline: Date
    @Binding var showingSheet: Bool
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2023, month: 2, day: 13)
        let endComponents = DateComponents(year: 2025, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    showingSheet.toggle()
                }) {
                    Text("Cancel")
                }
                Spacer()
                Text("Schedule")
                    .fontWeight(.bold)
                Spacer()
                Button(action: {
                    showingSheet.toggle()
                }) {
                    Text("Done")
                }

            }
            
            HStack {
                DatePicker(
                        "Deadline",
                         selection: $deadline,
                         in: dateRange,
                         displayedComponents: [.date, .hourAndMinute]
                    )
            }
            
        }
        .padding()
    }
}

struct ScheduleSheet_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleSheet(deadline: .constant(Date()), showingSheet: .constant(true))
    }
}
