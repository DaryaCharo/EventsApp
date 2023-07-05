//
//  EventManager.swift
//  EventsApp
//
//  Created by Darya Charniankova on 21.06.23.
//

import SwiftUI

protocol EventManagerProtocol {
    func getCurrentEvents(date: String) async -> [CurrentDayEvents]
    func getEvents() async -> [ListEvent]
    func getCategories() async -> [Categories]
}

final class EventManager: EventManagerProtocol {
    private let moyaManager = MoyaAPIManager()
    var currentEventsResult: [CurrentDayEvents] = []
    var listOfEvents: [ListEvent] = []
    var categories: [Categories] = []
    private var count = 0
    private var page = ""
    private var ids: [Int] = []
    
    func getEvents() async -> [ListEvent] {
        do {
            let data = try await self.moyaManager.getEvents(numberOfEvents: self.count,
                                                            page: self.page,
                                                            results: self.listOfEvents)
            listOfEvents.append(contentsOf: data.results)
        } catch {
            print(error)
        }
        return listOfEvents
    }
    
    func getCurrentEvents(date: String) async -> [CurrentDayEvents] {
        do {
            let data = try await self.moyaManager.getCurrentEvents(numberOfEvents: self.count,
                                                                   page: self.page,
                                                                   results: self.currentEventsResult,
                                                                   date: date)
            currentEventsResult.append(contentsOf: data.results)
        } catch {
            print(error)
        }
        return currentEventsResult
    }
    
    func getCategories() async -> [Categories] {
        do {
            let categoriesData = try await self.moyaManager.getCategories(categories: categories)
            categories.append(contentsOf: categoriesData)
        } catch {
            print(error)
        }
        return categories
    }
}



