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
    
    var body: some View {
        ZStack {
            mapView
        }
        .task {
            await vm.fillResults()
        }
    }
    
    private var mapView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                // Map
//                MapViewRepresentable(markers: $vm.$markers)
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
