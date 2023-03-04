//
//  BottomSheetViewModel.swift
//  Molinar
//
//  Created by Matt Molinar on 2/11/23.
//

import SwiftUI
import Foundation
import UIKit


class BottomSheetViewModel: ObservableObject {
    static let shared = BottomSheetViewModel()
    
    
    init() {}
    
    @Published var bottomSheetOffset: CGFloat = 0
    @Published var searchText = ""
    @Published var showAddTaskSheet = false

    
}

