//
//  PosterEventsProvider.swift
//  EventsApp
//
//  Created by Darya Charniankova on 7.06.23.
//

import Foundation
import Moya

enum EventsPosterType {
    case getAllEvents
}

extension EventsPosterType: TargetType {
    var baseURL: URL {
        switch self {
        case .getAllEvents:
            return URL(string: Constants.baseURL)!
        }
    }
    
    var path: String {
        switch self {
        case .getAllEvents:
            return "rubricId=10240351"
        }
    }
    
    var parameteres: [String: Any]? {
        var params = [String: Any]()
        switch self {
        case .getAllEvents:
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
        guard let params = parameteres else {
            return .requestPlain
        }
        return .requestParameters(parameters: params,
                                  encoding: parameterEncoding)
    }
    
    var headers: [String : String]? {
        nil
    }
}

