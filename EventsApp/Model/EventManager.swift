//
//  EventManager.swift
//  EventsApp
//
//  Created by Darya Charniankova on 21.06.23.
//

import SwiftUI

protocol EventManagerProtocol {
    @MainActor func getEvents() -> [CurrentDayEvents]
    @MainActor func getCategories() -> [Categories]
}

final class EventManager: EventManagerProtocol {
    private let moyaManager = MoyaAPIManager()
    
    var results: [CurrentDayEvents] = []
    var categories: [Categories] = []
    private var count = 0
    private var page = ""
    
    @MainActor func getEvents() -> [CurrentDayEvents] {
        Task {
            do {
                let data = try await self.moyaManager.getEventResults(numberOfEvents: self.count,
                                                                        page: self.page,
                                                                        results: self.results)
                self.results += data.results
            } catch {
                print(error)
            }
        }
        return self.results
    }
    
    @MainActor func getCategories() -> [Categories] {
        Task {
            do {
                let categoriesData = try await self.moyaManager.getCategories(categories: categories)
                categories += categoriesData
            } catch {
                print(error)
            }
        }
        return categories
    }
}


