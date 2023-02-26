//
//  PickerSectionView.swift
//  Molinar
//
//  Created by Matt Molinar on 2/23/23.
//

import SwiftUI

struct PickerSectionView: View {
    @Binding var selection: Int
    var pickerName: String
    var pickerOptions: [String]
    
    var body: some View {
        Group {
            HStack {
                Text(pickerName)
                Picker(selection: $selection, label: Text(pickerName)) {
                    ForEach(0..<pickerOptions.count) { index in
                        Text(pickerOptions[index]).tag(index)
                    }
                }
                Spacer()
            }
            Divider()
        }
    }
}
