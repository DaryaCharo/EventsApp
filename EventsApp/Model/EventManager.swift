//
//  EventManager.swift
//  EventsApp
//
//  Created by Darya Charniankova on 21.06.23.
//

import SwiftUI

protocol EventManagerProtocol {
    @MainActor func getCurrentEvents(date: String) async -> [CurrentDayEvents]
    @MainActor func getEvents() async -> [CurrentDayEvents]
    @MainActor func getCategories() async -> [Categories]
}

final class EventManager: EventManagerProtocol {
    private let moyaManager = MoyaAPIManager()
    var results: [CurrentDayEvents] = []
    var categories: [Categories] = []
    var places: [Place] = []
    private var count = 0
    private var page = ""
    private var ids: [Int] = []
    
    @MainActor func getEvents() async -> [CurrentDayEvents] {
        do {
            let data = try await self.moyaManager.getCurrentEvents(numberOfEvents: self.count,
                                                                  page: self.page,
                                                                  results: self.results)
            results.append(contentsOf: data.results)
        } catch {
            print(error)
        }
        return results
    }
    
    @MainActor func getCurrentEvents(date: String) async -> [CurrentDayEvents] {
        do {
            let data = try await self.moyaManager.getCurrentEvents(numberOfEvents: self.count,
                                                                  page: self.page,
                                                                  results: self.results,
                                                                  date: date)
            results.append(contentsOf: data.results)
        } catch {
            print(error)
        }
        return results
    }
    
    @MainActor func getCategories() async -> [Categories] {
        do {
            let categoriesData = try await self.moyaManager.getCategories(categories: categories)
            categories.append(contentsOf: categoriesData)
        } catch {
            print(error)
        }
        return categories
    }
}



