//
//  EventResult.swift
//  EventsApp
//
//  Created by Darya Charniankova on 11.06.23.
//

import Foundation

struct EventResult: Decodable {
    let numberOfEvents: Int?
    let page: String?
    let results: [CurrentDayEvents]
    
    enum CodingKeys: String, CodingKey {
        case results,
             numberOfEvents = "count",
             page = "next"
    }
}
