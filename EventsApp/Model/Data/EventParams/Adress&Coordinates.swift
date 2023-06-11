//
//  Coordinates.swift
//  EventsApp
//
//  Created by Darya Charniankova on 10.06.23.
//

import Foundation

struct Coordinates: Decodable {
    let lan: Double
    let lon: Double
    
    enum CodingKeys: String, CodingKey {
        case lan, lon
    }
}

struct CoordinateRadius: Decodable {
    let coordinates: Coordinates
    let radius: Double
    
    enum CodingKeys: String, CodingKey {
        case radius, coordinates
    }
}

struct Place: Decodable {
    let title: String
    let address: String
    let phone: String
    let coords: Coordinates
    let isClosed: Bool
    
    enum CodingKeys: String, CodingKey {
        case title, address, phone, coords,
             isClosed = "is_closed"
    }
}
