//
//  TaskFilterButtons.swift
//  Molinar
//
//  Created by Matt Molinar on 3/10/23.
//

import SwiftUI

enum TaskFilterOptions: Int, CaseIterable {
    case foryou
    case today
    case upcoming
    case projects
    
    var text: String {
        switch self {
        case .foryou: return "For you"
        case .today: return "Today"
        case .upcoming: return "Upcoming"
        case .projects: return "Projects"
        }
    }
}

struct TaskFilterButtons: View {
    @Binding var selectedOption:TaskFilterOptions
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(TaskFilterOptions.allCases.count)
    private var padding: CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue)
        let count = CGFloat(TaskFilterOptions.allCases.count)
        return (UIScreen.main.bounds.width / count * rawValue + 13)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                ForEach(TaskFilterOptions.allCases, id: \.self) { option in
                    Button(action: {
                        self.selectedOption = option
                    }, label: {
                        Text(option.text)
                            .frame(width: underlineWidth - 6)
                    })
                }
            }
            .padding(.bottom)
            Rectangle()
                .frame(width: underlineWidth - 24, height: 3, alignment: .center)
                .foregroundColor(.blue)
                .padding(.leading, padding)
                .animation(.spring())
            Divider()
                
        }
    }
}

struct TaskFilterButtons_Previews: PreviewProvider {
    static var previews: some View {
        TaskFilterButtons(selectedOption: .constant(.today) )
    }
}
