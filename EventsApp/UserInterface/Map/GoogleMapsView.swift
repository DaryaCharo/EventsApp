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
    private let lat = CitiesCoordinates.moscow.latitude
    private let lon = CitiesCoordinates.moscow.longitude
    var marker = GMSMarker()
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
        if marker.title == nil {
            marker.map = mapView
        }
        var markers = vm.results.map({ GMSMarker(position: CLLocationCoordinate2D(latitude: $0.object?.place?.coords?.lat ?? 0,
                                   longitude: $0.object?.place?.coords?.lon ?? 0))})
        for (index, value) in vm.results.enumerated() {
            markers[index].title = value.object?.title ?? ""
            markers[index].snippet = value.object?.place?.address ?? ""
            markers[index].map = mapView
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
