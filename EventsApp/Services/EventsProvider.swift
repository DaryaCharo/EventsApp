//
//  EventsData.swift
//  EventsApp
//
//  Created by Darya Charniankova on 6.06.23.
//

import Foundation
import Moya

enum EventType {
    case pubsAndBarsList, karaokeList, hookahList, nightClubsList
    case strikeBollPlaces, laserTagPlaces, shootingPlaces
//    case questsList, golfClubsList, artPlacesList, mafiaGamePlacesList,
}

extension EventType: TargetType {
    var baseURL: URL {
        switch self {
        case .pubsAndBarsList, .karaokeList, .hookahList, .nightClubsList, .strikeBollPlaces, .laserTagPlaces, .shootingPlaces:
            return URL(string: Constants.baseURL)!
        }
    }
    
    var path: String {
        switch self {
        case .pubsAndBarsList:
            return "rubricId=10240351"
        case .karaokeList:
            return "rubricId=10240351"
        case .hookahList:
            return "rubricId=10329273"
        case .nightClubsList:
            return "rubric=187"
        case .strikeBollPlaces:
            return ""
        case .laserTagPlaces:
            return ""
        case .shootingPlaces:
            return ""
        }
    }
    //пока не трогала
    var parameters: [String: Any]? {
        var params = [String: Any]()
        switch self {
        case .pubsAndBarsList:
            return params
        case .karaokeList:
            return params
        case .hookahList:
            return params
        case .nightClubsList:
            return params
        case .strikeBollPlaces:
            return params
        case .laserTagPlaces:
            return params
        case .shootingPlaces:
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


