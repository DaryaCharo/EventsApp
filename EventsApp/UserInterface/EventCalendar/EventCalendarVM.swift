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
    
    func getEvents() async {
        if results.isEmpty {
            await fillResults()
        }
    }
    
    func fillResults() async {
        let result = await eventManager.getCurrentEvents(date: date.ISO8601Format())
        await MainActor.run {
            results = result
        }
    }
}
