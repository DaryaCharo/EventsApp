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
    @Published var isFavourite = false
//    @Published var isFavourite: FavouriteState = .notFavourite
    
    func getEvents() async {
        if results.isEmpty {
            await fillResults()
            await getEventWithCategory()
            await setRandomFeatureEvent()
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
            self == .favourite ? 1 : 2
        }
    }
}


