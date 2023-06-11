//
//  EventResult.swift
//  EventsApp
//
//  Created by Darya Charniankova on 11.06.23.
//

import Foundation

struct EventResult: Decodable {
    let numberOfEvents: Int
    let nextPage: String?
    let previousPage: String?
    let result: CurrentDayEvents
    
    enum CodingKeys: String, CodingKey {
        case result,
             numberOfEvents = "count",
             nextPage = "next",
             previousPage = "previous"
    }
}
