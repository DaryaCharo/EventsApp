//
//  EventManager.swift
//  EventsApp
//
//  Created by Darya Charniankova on 21.06.23.
//

import SwiftUI

protocol EventManagerProtocol {
    func getCurrentEvents(date: String) async -> [CurrentDayEvents]
    func getEvents(id: Int) async -> [ListEvent]
    func getCategories() async -> [Categories]
}

final class EventManager: EventManagerProtocol {
    private let moyaManager = MoyaAPIManager()
    var currentEventsResult: [CurrentDayEvents] = []
    var listOfEvents: [ListEvent] = []
    var categories: [Categories] = []
    private let currentDate = Int(Date.now.timeIntervalSince1970)
    private var count = 0
    private var nextPage = ""
    private var ids: [Int] = []
    
    func getEvents(id: Int) async -> [ListEvent] {
        var pageNumber = 1
        do {
                while pageNumber < 2 {
                pageNumber += 1
                let data = try await self.moyaManager.getEvents(numberOfEvents: self.count,
                                                                nextPage: self.nextPage,
                                                                results: self.listOfEvents,
                                                                page: pageNumber,
                                                                id: id)
                    for event in data.results where (event.dates?.contains(where: { $0.start ?? 0 >= currentDate })) != nil {
                        if event.dates?.last?.startDate == nil {
                            continue
                        }
                    listOfEvents.append(contentsOf: data.results)
                }
            }
        } catch {
            print(error)
        }
        return listOfEvents
    }
    
    func getCurrentEvents(date: String) async -> [CurrentDayEvents] {
        do {
            let data = try await self.moyaManager.getCurrentEvents(numberOfEvents: self.count,
                                                                   page: self.nextPage,
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



