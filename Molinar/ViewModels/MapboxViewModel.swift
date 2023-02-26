//
//  MapViewModel.swift
//  Molinar
//
//  Created by Matt Molinar on 2/11/23.
//

import SwiftUI
import Foundation
import UIKit

class MapboxViewModel: ObservableObject {
    static let shared = MapboxViewModel()
    init() {}
    
    @Published var mapboxView = MapboxView()
    @Published var filterButtons = FilterLabels()
}
