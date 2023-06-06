//
//  EventsData.swift
//  EventsApp
//
//  Created by Darya Charniankova on 6.06.23.
//

import Foundation
import Moya

enum EventsAPIProvider {
    case getPubsAndBarsList
}

//ругается, забыла добавить moyaprovider
extension EventsAPIProvider: TargetType {
    var baseURL: URL {
        switch self {
        case .getPubsAndBarsList:
            return URL(string: Constants.baseURL)!
        }
    }
    
    var path: String {
        switch self {
        case .getPubsAndBarsList:
            return "rubricId=10240351"
        }
        
        var parametres: [String: Any]? {
            var params = [String: Any]()
            switch self {
            case .getPubsAndBarsList:
                
                return params
            }
            
            var parameterEncoding: ParameterEncoding {
                URLEncoding.default
            }
            
            var method: Moya.Method {
                .get
            }
            
            var task: Moya.Task {
                guard let params = parametres else {
                    return .requestPlain
                }
                return .requestParameters(parameters: params,
                                          encoding: parameterEncoding)
            }
            
            var headers: [String : String]? {
                nil
            }
        }
    }
}
