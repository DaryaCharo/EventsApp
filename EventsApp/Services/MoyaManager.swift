//
//  MoyaManager.swift
//  EventsApp
//
//  Created by Darya Charniankova on 6.06.23.
//

import Foundation
import Moya

protocol MoyaAPIManagerProtocol: AnyObject {
    func getPlacesList(eventType: EventType) async throws -> [EventsData]
    func getPosterEventsData(eventType: EventsPosterType) async throws -> [EventsPosterData]
}

class MoyaAPIManager: MoyaAPIManagerProtocol {
    
    private let eventsProvider = MoyaProvider<EventType>()
    private let eventsPosterProvider = MoyaProvider<EventsPosterType>()

    
    //MARK: - get poster events (kuda go API)
    
    func getPosterEventsData(eventType: EventsPosterType) async throws -> [EventsPosterData] {
        try await getPosterEvents(eventType: eventType)
    }
    
    //MARK: - get places list (relax API) -

    func getPlacesList(eventType: EventType) async throws -> [EventsData] {
        try await getPlaces(eventType: eventType)
    }
    
    private func getPosterEvents(eventType: EventsPosterType) async throws -> [EventsPosterData] {
        return try await withCheckedThrowingContinuation { continuation in
            eventsPosterProvider.request(eventType) { result in
                switch result {
                    
                case .success(let response):
                    
                    do {
                        let places = try response.map([EventsPosterData].self)
                        continuation.resume(with: .success(places))
                    } catch {
                        continuation.resume(throwing: error)
                    }
                    
                case .failure(let error):
                    continuation.resume(with: .failure(error))
                }
            }
        }
    }
    
    private func getPlaces(eventType: EventType) async throws -> [EventsData] {
        return try await withCheckedThrowingContinuation { continuation in
            eventsProvider.request(eventType) { result in
                switch result {
                    
                case .success(let response):
                    
                    do {
                        let places = try response.map([EventsData].self)
                        continuation.resume(with: .success(places))
                    } catch {
                        continuation.resume(throwing: error)
                    }
                    
                case .failure(let error):
                    continuation.resume(with: .failure(error))
                }
            }
        }
    }
}

struct Constants {
    static var baseURL = "https://api2.relax.by/"
    static var placesURL = "v=2.0&tree=searchTreeId&method=place.getForMap&cityId=1"
}
