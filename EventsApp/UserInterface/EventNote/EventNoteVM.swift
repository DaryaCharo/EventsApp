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
    
    @Published var results: [ListEvent] = []
    @Published var places: [PlaceForCurrentEvent] = []
    
    //    //MARK: - getEvents
    
    func getEvents() async {
        if results.isEmpty {
            await fillResults()
        }
    }
    
    func fillResults() async {
        let result = await eventManager.getEvents()
        await MainActor.run {
            results = result
        }
    }
}


