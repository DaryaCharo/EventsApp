//
//  EventNoteVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 18.06.23.
//

import SwiftUI

final class EventNoteVM: ObservableObject {
    lazy var eventManager: EventManagerProtocol = {
        EventManager()
    }()
    
    @Published var results: [CurrentDayEvents] = []
    @Published var places: [Place] = []
    
    //    //MARK: - getEvents
    
    @MainActor func fillResults() async {
        results = await eventManager.getEvents()
    }
}


