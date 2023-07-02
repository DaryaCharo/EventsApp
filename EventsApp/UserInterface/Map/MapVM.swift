//
//  MapVM.swift
//  EventsApp
//
//  Created by Darya Charniankova on 29.06.23.
//

import SwiftUI
import GoogleMaps

final class MapVM: ObservableObject {
    lazy var eventManager: EventManagerProtocol = {
        EventManager()
    }()
    @Published var markers: [GMSMarker] = []
    
    @Published var results: [CurrentDayEvents] = []
    private var lat = Double()
    private var lon = Double()
    
    var camera = GMSCameraPosition.camera(withLatitude: CitiesCoordinates.moscow.latitude,
                                          longitude: CitiesCoordinates.moscow.longitude, zoom: 5.5)
    
    func findPlaceOnTheMap(lat: Double,
                           lon: Double) {
        camera = GMSCameraPosition.camera(withLatitude: lat,
                                          longitude: lon, zoom: 4.0)
    }
    
    func getAllPlacesOnTheMap() {
        
    }
    
    //    //MARK: - getEvents
    
    func fillResults() async {
        let result = await eventManager.getCurrentEvents(date: Date.now.ISO8601Format())
        await MainActor.run {
            results = result
        }
    }
}

enum CitiesCoordinates {
    case moscow, spb, yekaterinburg, kazan, nizhnyNovgorod, novosibirsk
    
    var latitude: Double {
        switch self {
        case .moscow:
            return 55.7558
        case .spb:
            return 59.9343
        case .yekaterinburg:
            return 56.8431
        case .kazan:
            return 55.7879
        case .nizhnyNovgorod:
            return 56.3269
        case .novosibirsk:
            return 54.9833
        }
    }
    
    var longitude: Double {
        switch self {
        case .moscow:
            return 37.6173
        case .spb:
            return 30.3351
        case .yekaterinburg:
            return 60.6454
        case .kazan:
            return 49.1233
        case .nizhnyNovgorod:
            return 44.0059
        case .novosibirsk:
            return 82.8964
        }
    }
}
