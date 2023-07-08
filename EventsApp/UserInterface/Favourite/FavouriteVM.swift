//
//  FavouriteVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 8.07.23.
//

import SwiftUI

final class FavouriteVM: ObservableObject {
    lazy private var eventManager: EventManagerProtocol = {
        EventManager()
    }()
    private let providers = Providers()
    var favourites: [Int] = []
    @Published var results: [ListEvent] = []
    
    func showFavorites() async {
        if results.isEmpty {
            await fillResults()
        }
    }
     
    private func fillResults() async {
        for id in favourites {
            let result = await eventManager.getEvents(id: id)
            await MainActor.run {
                results = result
            }
        }
    }
    
    func editFavourites(action: ActionType,
                        ids: [Int]) async {
        switch action {
        case .add:
            await providers.makeFavourite(eventIDs: ids)
        case .update:
            await providers.updateFavourites(eventIDs: ids)
        }
    }
    
    enum ActionType {
        case add, update
    }
}
