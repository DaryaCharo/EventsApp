//
//  MoyaManager.swift
//  EventsApp
//
//  Created by Darya Charniankova on 6.06.23.
//

import Foundation
import Moya

protocol MoyaAPIManagerProtocol: AnyObject {
    func getEventResults(numberOfEvents count: Int,
                         page: String?,
                         results: [CurrentDayEvents],
                         lang: String,
                         textFormat: String,
                         location: String,
                         date: String,
                         expand: String) async throws -> EventResult
    
    func getCategories(categories: [Categories]) async throws -> [Categories]
}

class MoyaAPIManager: MoyaAPIManagerProtocol {
        
    private lazy var eventsProvider: MoyaProvider<Events> = {
        MoyaProvider<Events>(plugins: [networkPlugin])
    }()
    
    private lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    private lazy var networkPlugin: NetworkLoggerPlugin = {
        let formatter = NetworkLoggerPlugin.Configuration.Formatter(
            requestData: jsonDataFormatter,
            responseData: jsonDataFormatter)
        
        let configuration = NetworkLoggerPlugin.Configuration(
            formatter: formatter,
            output: NetworkLoggerPlugin.Configuration.defaultOutput,
            logOptions: .verbose
        )
        return NetworkLoggerPlugin(configuration: configuration)
    }()
    
    func getEventResults(numberOfEvents count: Int,
                         page: String?,
                         results: [CurrentDayEvents],
                         lang: String = "ru",
                         textFormat: String = "text",
                         location: String = "msk",
                         date: String = "2023-06-14",
                         expand: String = "object") async throws -> EventResult {
        return try await withCheckedThrowingContinuation { continuation in
            eventsProvider.request(.getEventResult(count: count,
                                                    page: page,
                                                    results: results,
                                                    lang: lang,
                                                    textFormat: textFormat,
                                                    location: location,
                                                    date: date,
                                                    expand: expand)) { result in
                
                switch result {
                case .success(let response):
                    
                    do {
                        let results = try response.map(EventResult.self)
                        continuation.resume(returning: results)
                    } catch {
                        continuation.resume(throwing: error)
                    }
                    
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func getCategories(categories: [Categories]) async throws -> [Categories] {
        return try await withCheckedThrowingContinuation { continuation in
            eventsProvider.request(.getEventGenres(categories: categories)) { result in
                switch result {
                case .success(let response):
                    
                    do {
                        let results = try response.map([Categories].self)
                        continuation.resume(with: .success(results))
                    } catch {
                        continuation.resume(throwing: error)
                    }
                    
                case .failure(let error):
                    continuation.resume(with: .failure(error))
                }
            }
        }
    }
    
    private func jsonDataFormatter(_ data: Data) -> String {
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON,
                                                        options: .prettyPrinted)
            guard let result = String(data: prettyData,
                                      encoding: String.Encoding.utf8) else {
                return String(decoding: data,
                              as: UTF8.self)
            }
            return result
        } catch {
            return String(decoding: data,
                          as: UTF8.self)
        }
    }
}

struct Constants {
    static var baseURL = "https://kudago.com/public-api/v1.4"
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
