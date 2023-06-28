//
//  EventCalendarVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 19.06.23.
//

import SwiftUI

final class EventCalendarVM: ObservableObject {
    @Published var date = Date.now
    lazy var eventManager: EventManagerProtocol = {
        EventManager()
    }()
    @Published var results: [CurrentDayEvents] = []
    
    //    //MARK: - getEvents
    
    @MainActor func fillResults() async {
        results = await eventManager.getCurrentEvents(date: date.ISO8601Format())
    }
}
