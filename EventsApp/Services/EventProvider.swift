//
//  EventsData.swift
//  EventsApp
//
//  Created by Darya Charniankova on 6.06.23.
//

import Foundation
import Moya

enum Events {
    case getCurrentEvents(count: Int,
                          page: String?,
                          results: [CurrentDayEvents],
                          lang: String?,
                          textFormat: String?,
                          location: String?,
                          date: String?,
                          expand: String)
    
    case getEvents(count: Int,
                   page: String?,
                   results: [ListEvent],
                   lang: String?,
                   textFormat: String?,
                   location: String?,
                   id: Int,
                   expand: String,
                   fields: String,
                   actualSince: Int?)
    
    case getEventGenres(categories: [Categories])
}

extension Events: TargetType {
    var baseURL: URL {
        switch self {
        case .getCurrentEvents, .getEvents, .getEventGenres:
            return URL(string: Constants.baseURL)!
        }
    }
    
    var path: String {
        switch self {
        case .getCurrentEvents:
            return Constants.eventOfTheDayURL
        case .getEventGenres:
            return Constants.eventCategories
        case .getEvents:
            return Constants.eventsURL
        }
    }
    var parameters: [String: Any]? {
        var params = [String: Any]()
        switch self {
        case .getCurrentEvents(let count,
                               let page,
                               let results,
                               let lang,
                               let textFormat,
                               let location,
                               let date,
                               let expand):
            params["count"] = count
            params["next"] = page
            params["results"] = results
            params["lang"] = lang
            params["text_format"] = textFormat
            params["location"] = location
            params["date"] = date
            params["expand"] = expand
            
        case .getEvents(let count,
                        let page,
                        let results,
                        let lang,
                        let textFormat,
                        let location,
                        let id,
                        let expand,
                        let fields,
                        let actualSince):
            params["count"] = count
            params["next"] = page
            params["results"] = results
            params["lang"] = lang
            params["text_format"] = textFormat
            params["location"] = location
            params["id"] = id
            params["expand"] = expand
            params["fields"] = fields
            params["actualSince"] = actualSince
            
        case .getEventGenres(let categories):
            params["categories"] = categories
        }
        return params
    }
    
    var parameterEncoding: ParameterEncoding {
        URLEncoding.default
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        guard let params = parameters else {
            return .requestPlain
        }
        return .requestParameters(parameters: params,
                                  encoding: parameterEncoding)
    }
    
    var headers: [String : String]? {
        nil
    }
}


