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
    
    //под большим вопросом, потому что мне нужен резалтс в нескольких местах, но я имею доступ только в функциям и выходит какая-то не очень штука
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

    @MainActor func fillResults() async {
        results = await eventManager.getEvents()
    }
    
    //MARK: -getEventByCategory
    
    @MainActor func getEventWithCategory() async {
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
