//
//  Coordinates.swift
//  EventsApp
//
//  Created by Darya Charniankova on 10.06.23.
//

import Foundation

struct Place: Decodable {
    let id: Int
    let title: String?
    let address: String?
    let timetable: String?
    let phone: String?
    let coords: Coordinates?
    let isClosed: Bool?
    let officialSiteLink: String?
    let bodyText: String?
    let description: String?
    let subway: String?
    let images: [EventImages]?
    
    enum CodingKeys: String, CodingKey {
        case id, title, address, phone, coords, timetable, images, subway, description,
             isClosed = "is_closed",
             officialSiteLink = "foreign_url",
             bodyText = "body_text"
    }
}

struct Coordinates: Decodable {
    let lat: Double
    let lon: Double
    
    enum CodingKeys: String, CodingKey {
        case lat, lon
    }
}

struct CoordinateRadius: Decodable {
    let coordinates: Coordinates
    let radius: Double
    
    enum CodingKeys: String, CodingKey {
        case radius, coordinates
    }
}
