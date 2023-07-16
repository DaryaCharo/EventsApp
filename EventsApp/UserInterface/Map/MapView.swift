//
//  MapView.swift
//  EventsApp
//
//  Created by Darya Charniankova on 14.06.23.
//

import GoogleMaps
import GooglePlaces
import SwiftUI

struct MapView: View {
    @StateObject var vm = MapVM()
    var lat = CitiesCoordinates.moscow.latitude
    var lon = CitiesCoordinates.moscow.longitude
    
    var body: some View {
        VStack {
            map
                .padding(.top, 32)
        }
        .task {
            await vm.fillResults()
        }
    }
    
    private var map: some View {
        VStack {
            if vm.results.isEmpty ||
                lat != CitiesCoordinates.moscow.latitude {
                let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: lat,                                                          longitude: lon))
                
                GoogleMapsView(marker: marker)
            } else {
                GoogleMapsView(vm: vm)
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
