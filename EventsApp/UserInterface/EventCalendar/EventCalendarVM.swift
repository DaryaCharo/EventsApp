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
    
    
}
