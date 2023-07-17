//
//  FavouriteVew.swift
//  EventsApp
//
//  Created by Darya Charniankova on 17.06.23.
//

import SwiftUI

struct FavouriteView: View {
    @StateObject var vm = FavouriteVM()
    
    var body: some View {
        VStack {
            HeaderWithBackBtn(title: "Favourite events")
            
            if vm.results.isEmpty {
                Spacer()
                ResultView(type: .favourites)
                    .padding(.bottom, 32)
                Spacer()
            } else {
                ScrollView {
                    listOfFavEvents
                }
            }
        }
        .task {
            await vm.showFavorites()
        }
    }
    
    private var listOfFavEvents: some View {
        VStack {
            ForEach(vm.results, id: \.id) { result in
                EventFromListView(event: result)
                    .padding(.bottom)
            }
        }
    }
}

struct FavouriteVew_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
