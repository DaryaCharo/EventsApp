//
//  EventsData.swift
//  EventsApp
//
//  Created by Darya Charniankova on 6.06.23.
//

import Foundation
import Moya

enum Events {
    case getEvents(lang: String,
                   expand: [String],
                   fields: [String],
                   location: String)
}

extension Events: TargetType {
    var baseURL: URL {
        switch self {
        case .getEvents:
            return URL(string: Constants.baseURL)!
        }
    }
    
    var path: String {
        switch self {
        case .getEvents:
            return Constants.eventOfTheDayURL
        }
    }
    //пока не трогала
        var parameters: [String: Any]? {
            var params = [String: Any]()
            switch self {
            case .getEvents(let lang,
                            let expand,
                            let fields,
                            let location):
                params["lang"] = lang
                params["expand"] = expand
                params["fields"] = fields
                params["location"] = location
                
                return params
            }
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


