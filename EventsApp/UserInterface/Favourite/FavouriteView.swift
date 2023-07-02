//
//  FavouriteVew.swift
//  EventsApp
//
//  Created by Darya Charniankova on 17.06.23.
//

import SwiftUI

struct FavouriteView: View {
    var body: some View {
        ScrollView {
            VStack {
                HeaderWithBackBtn(title: "Favourite events")
                
                listOfFavEvents
            }
        }
    }

    private var listOfFavEvents: some View {
        VStack {
            
        }
    }
}

struct FavouriteVew_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
