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
    @Published var state: ResultState = .loading
    @Published var showView: ShowView?
    @Published var results: [CurrentDayEvents] = []
    @Published var featuredEvent: CurrentEvent?
    @Published var categories: [Categories] = []
    @Published var isFavourite = false
//    @Published var isFavourite: FavouriteState = .notFavourite
    
    func getEvents() async {
        if results.isEmpty {
            await MainActor.run {
                state = .loading
            }
            
            await fillResults()
            await getEventWithCategory()
            await setRandomFeatureEvent()
        } else {
            await MainActor.run {
                state = .fetch
            }
        }
    }
    
    func setRandomFeatureEvent() async {
        guard let tomorrowDate = Calendar.current.date(bySetting: .day, value: 1, of: Date.now),
            let featureDate = Calendar.current.date(byAdding: .day, value: 7, to: tomorrowDate) else { return }
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
        case favourite, fullInfoView
        var id: Int {
            switch self {
            case .favourite:
                return 1
            case .fullInfoView:
                return 2
            }
        }
    }
}


