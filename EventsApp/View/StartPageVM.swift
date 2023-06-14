//
//  StartPageVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 8.06.23.
//

import SwiftUI

final class StartPageVM: ObservableObject {
    let moyaManager = MoyaAPIManager()
    @Published var results: [CurrentDayEvents] = []
    var count = 0
    var page = ""
    
    func getEvents() {
        DispatchQueue.main.async {
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
        }
    }
}
