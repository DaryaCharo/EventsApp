//
//  MoyaManager.swift
//  EventsApp
//
//  Created by Darya Charniankova on 6.06.23.
//

import Foundation
import Moya

protocol MoyaAPIManagerProtocol: AnyObject {
    func getEvents(events: Events) async throws -> [EventsData]
}

class MoyaAPIManager: MoyaAPIManagerProtocol {
    
    private let eventsProvider = MoyaProvider<Events>()
    
    func getEvents(events: Events) async throws -> [EventsData] {
        return try await withCheckedThrowingContinuation { continuation in
            eventsProvider.request(events) { result in
                switch result {
                    
                case .success(let response):
                    
                    do {
                        let eventsList = try response.map([EventsData].self)
                        continuation.resume(with: .success(eventsList))
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
    static var baseURL = "https://kudago.com/public-api/v1.4/"
    static var searchURL = "/search/"
    static var eventListURL = "/lists/"
    static var eventOfTheDayURL = "/events-of-the-day/"
    static var eventsURL = "/events/"
    static var movieShowingsURL = "/movie-showings/"
    static var listOfSingers = "/agents/"
    
    static var eventCategories = "/event-categories/"
    static var placesCategories = "/place-categories/"
    
    static var placesURL = "v=2.0&tree=searchTreeId&method=place.getForMap&cityId=1"
}
