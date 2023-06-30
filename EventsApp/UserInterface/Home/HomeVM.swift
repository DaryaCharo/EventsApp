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
    
    lazy var eventManager: EventManagerProtocol = {
       EventManager()
    }()
    
    @Published var results: [CurrentDayEvents] = []
    @Published var categories: [Categories] = []
    @Published var places: [Place] = []
    var showFavView: ShowFavView?
    
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
    
//    //MARK: - getEvents

    func fillResults() async {
        results = await eventManager.getCurrentEvents(date: Date.now.ISO8601Format())
    }
    
    //MARK: -getEventByCategory
    
    func getEventWithCategory() async {
        categories = await eventManager.getCategories()
    }
    
    
    //MARK: - favourite
    
    func countFavourite() -> String {
        ""
    }
    
    deinit {
        cancellable.removeAll()
    }
}

enum ShowFavView: Identifiable {
    case favourite
    var id: Int {
        switch self {
        case .favourite:
            return 1
        }
    }
}
