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
    @Published var isFavourite = false
    @Published var showView: ShowView?
    
    func showFavorites() async {
        if results.isEmpty {
            await fillResults()
        }
    }
    
    func checkIsEventFav(id: Int) async {
        if favourites.contains(id),
                 !isFavourite {
           isFavourite.toggle()
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
                        id: Int) async {
        switch action {
        case .add:
            if !favourites.contains(id) {
                favourites.append(id)
                
                await providers.changeFavourites(eventID: id,
                                                 action: action)
                print("added")
                print("\(favourites)")
            }
        case .update:
            if !favourites.isEmpty && favourites.contains(id){
                favourites.removeAll(where: { $0 == id })
                await providers.changeFavourites(eventID: id,
                                                 action: action)
                print("removed")
            }
        case .check:
            if providers.favouritesIDs.contains(where: { $0 == id }) {
                favourites = providers.favouritesIDs
                await MainActor.run {
                    isFavourite = true
                }
            }
            print("checked")
            print(favourites)
            print(providers.favouritesIDs)
        }
    }
    
    enum ShowView: Identifiable {
        case favouriteView
        var id: Int {
            return 1
        }
    }
}
