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
    @Published var showView: ShowView?
    @Published var results: [CurrentDayEvents] = []
    @Published var categories: [Categories] = []
    @Published var places: [Place] = []
    
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
    
    
    //MARK: - favourite
    
    func countFavourite() -> String {
        ""
    }
    
    deinit {
        cancellable.removeAll()
    }
    
    enum ShowView: Identifiable {
        case favourite
        var id: Int {
            switch self {
            case .favourite:
                return 1
            }
        }
    }
}


