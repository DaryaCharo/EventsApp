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
    @State var lat = CitiesCoordinates.moscow.latitude
    @State var lon = CitiesCoordinates.moscow.longitude
    private var map: GMSMapView {
        let mapView = GMSMapView.map(withFrame: CGRect.zero,
                                     camera: vm.camera)
        return mapView
    }
    
    var body: some View {
        ZStack {
            mapView
        }
        .task {
            if vm.results.isEmpty {
                await vm.fillResults()
            }
        }
    }

    private var mapView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
