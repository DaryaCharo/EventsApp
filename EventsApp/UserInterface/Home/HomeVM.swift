//
//  HomeVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 14.06.23.
//

//пользовательские данные хранить в переменных


import SwiftUI
import Combine

final class HomeVM: ObservableObject {
    private var cancellable = Set<AnyCancellable>()
    
    let moyaManager = MoyaAPIManager()
    @Published var results: [CurrentDayEvents] = []
    @Published var categories: [Categories] = []
    var count = 0
    var page = ""
    @Published var showView: ShowingView?
    @Published var searchText: String = ""
    
    init () {
        $searchText
            .removeDuplicates()
            .sink { [weak self] text in
                guard let self = self else { return }
                self.searchText = text
            }
            .store(in: &cancellable)
    }
    
    //MARK: - getEvents
    
    func getEvents() {
        //main actor
        DispatchQueue.main.async {
            Task {
                do {
                    let data = try await self.moyaManager.getEventResults(numberOfEvents: self.count,
                                                                          page: self.page,
                                                                          results: self.results)
                    self.results += data.results
                    
                    let categoriesData = try await self.moyaManager.getCategories(categories: self.categories)
                    self.categories += categoriesData
                } catch {
                    print(error)
                }
            }
        }
    }
    
    //MARK: -getEventByCategory
    
    func getEventWithCategory(category: String) {
        //в зависимости от жанра ивента выдавать только этот ивент
        //        switch ~categories { ... }
    }
    
    
    //MARK: - favourite
    
    func countFavourite() -> String {
        "(\(count))"
    }
    
    deinit {
        cancellable.removeAll()
    }
}

enum ShowingView: Identifiable {
    case notification, favourite
    
    var id: Int {
        switch self {
        case .notification:
            return 1
        case .favourite:
            return 2
        }
    }
}
