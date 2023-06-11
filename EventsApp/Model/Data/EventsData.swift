//
//  Events.swift
//  EventsApp
//
//  Created by Darya Charniankova on 6.06.23.
//

import Foundation

struct EventsData: Decodable {
    let lang: String
    let expand: String
    let numberOfEvents: Int
    let fields: EventFields
    let orderBy: EventOrder
    let location: String
    let actualSince: Date
    let actualUntil: Date
    let isFree: Bool
    let categories: Categories
    let coordinates: Coordinates
    let radius: CoordinateRadius
    
    enum CodingKeys: String, CodingKey {
        case lang, fields, location, categories, coordinates, radius, expand,
             numberOfEvents = "page_size",
             orderBy = "order_by",
             actualSince = "actual_since",
             actualUntil = "actual_until",
             isFree = "is_free"
    }
}

enum Language: String {
    case ru, en
}

enum Cities: String {
    case msk, spb, nnb
}
