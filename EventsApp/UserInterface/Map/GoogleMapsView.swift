//
//  MapViewControllerBridge.swift
//  EventsApp
//
//  Created by Darya Charniankova on 29.06.23.
//

import SwiftUI
import GoogleMaps

struct GoogleMapsView: UIViewRepresentable {
    @StateObject var vm = MapVM()
    var lat = CitiesCoordinates.moscow.latitude
    var lon = CitiesCoordinates.moscow.longitude
    var currentEvent: CurrentEvent?
    var eventFromList: ListEvent?
    var type: EventType?
    var markers: [GMSMarker] = []
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
        let markers = vm.results.map({ GMSMarker(position: CLLocationCoordinate2D(latitude: $0.object?.place?.coords?.lat ?? 0,
                                   longitude: $0.object?.place?.coords?.lon ?? 0))})
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

enum EventType {
    case current, fromList
}
