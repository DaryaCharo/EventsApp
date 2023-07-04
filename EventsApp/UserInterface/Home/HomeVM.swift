//
//  HomeVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 14.06.23.
//

import SwiftUI

final class HomeVM: ObservableObject {
    lazy var eventManager: EventManagerProtocol = {
        EventManager()
    }()
    @Published var showView: ShowView?
    @Published var results: [CurrentDayEvents] = []
    @Published var featuredEvent: CurrentEvent?
    @Published var categories: [Categories] = []
    @Published var places: [Place] = []
    
    func setRandomFeatureEvent() async {
        guard let featureDate = Calendar.current.date(byAdding: .day, value: 7, to: Date.now) else { return }
        print(featureDate)
        print(Date.now)
        let result = await eventManager.getCurrentEvents(date: featureDate.ISO8601Format())
        await MainActor.run {
            featuredEvent = result.randomElement()?.object
        }
    }
    
    //MARK: - getEvents
    
    func fillResults() async {
        let result = await eventManager.getCurrentEvents(date: Date.now.ISO8601Format())
        await MainActor.run {
            results = result
        }
        
    }
    
    //MARK: -getEventByCategory
    
    func getEventWithCategory() async {
        let result = await eventManager.getCategories()
        await MainActor.run {
            categories = result
        }
        
    }
    
    enum ShowView: Identifiable {
        case favourite
        var id: Int {
            switch self {
            case .favourite:
                return 1
            }
        }
    }
}


