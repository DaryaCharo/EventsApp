//
//  MapViewControllerBridge.swift
//  EventsApp
//
//  Created by Darya Charniankova on 29.06.23.
//

import SwiftUI
import GoogleMaps

struct GoogleMapsView: UIViewRepresentable {
    var lat = CitiesCoordinates.moscow.latitude
    var lon = CitiesCoordinates.moscow.longitude
    var markers: [GMSMarker] = []
    var currentEvent: CurrentEvent?
    var eventFromList: ListEvent?
    var type: EventType?
    let mapView = GMSMapView.map(withFrame: CGRect.zero,
                                 camera: .camera(withLatitude: 0,
                                                 longitude: 0,
                                                 zoom: 12))
    
    func makeUIView(context: Context) -> GMSMapView {
        mapView.camera = GMSCameraPosition(latitude: lat,
                                           longitude: lon,
                                           zoom: 12)
        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        
        markers.forEach { marker in
            marker.title = type == .current ?
            currentEvent?.title ?? "" :
            eventFromList?.title ?? ""
            marker.map = mapView
        }
    }
}

struct GoogleMapsView_Previews: PreviewProvider {
    static var previews: some View {
        GoogleMapsView()
    }
}

