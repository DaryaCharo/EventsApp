//
//  HomeVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 14.06.23.
//

import SwiftUI
import Combine

final class HomeVM: ObservableObject {
    private var cancellable = Set<AnyCancellable>()
    
    let moyaManager = MoyaAPIManager()
    @Published var results: [CurrentDayEvents] = []
    var count = 0
    var page = ""
    
    @Published var searchText = "" // думаю поменять на binding
    
    init () {
        $searchText
            .removeDuplicates()
            .sink { [weak self] text in
                guard let self = self else { return }
                self.searchText = text
                print(searchText)
        }
        .store(in: &cancellable)
    }
    
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
    
    deinit {
        cancellable.removeAll()
    }
}
