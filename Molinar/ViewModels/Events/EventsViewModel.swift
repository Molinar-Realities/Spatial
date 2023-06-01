//
//  EventsViewModel.swift
//  Molinar
//
//  Created by Matt Molinar on 5/30/23.
//

import SwiftUI
import CoreLocation
import Combine
import Supabase

class EventsViewModel: ObservableObject {
    @Published var events = [Event]()
    @Published var isLoading = false
    @Published var selectedEvent: Event = Event(dictionary: ["": ""])
    
    
    init() {
        fetchEvents()
    }
    
    func fetchEvents() {
        
    }
}
