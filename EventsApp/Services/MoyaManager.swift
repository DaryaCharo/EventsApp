//
//  MoyaManager.swift
//  EventsApp
//
//  Created by Darya Charniankova on 6.06.23.
//

import Foundation
import Moya

protocol MoyaAPIManagerProtocol: AnyObject {
    //еще добавлю
    func getPubsAndBarsList() async throws -> [PubsAndBarsData]
}

class MoyaAPIManager: MoyaAPIManagerProtocol {
    private let eventsProvider: MoyaProvider<EventsAPIProvider>
    
    init() {
        eventsProvider = MoyaProvider<EventsAPIProvider>()
    }
    
    //накидала 1, потом добавлю ещё
//    MARK: - get pabs/bars list
    func getPabAndPBarsList() async throws -> [EventsData] {
        return try await withCheckedThrowingContinuation { continuation in
            eventsProvider.request(.getPubsAndBarsList) { result in
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
    //
}

struct Constants {
    static var baseURL = "https://api2.relax.by/"
}
