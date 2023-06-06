//
//  Events.swift
//  EventsApp
//
//  Created by Darya Charniankova on 6.06.23.
//

import Foundation

struct EventsData: Decodable {
    let id: Int
    let type: String
    let title: String
    let shortTitle: String
    let viewType: String
    let lat: Double
    let lon: Double
    let image: String
    let squareLogo: SquareLogo
    
    enum CodingKeys: String, CodingKey {
        case id, type, title, lat, lon, image
        case shortTitle = "short_title"
        case viewType = "view_type"
    }
}

struct SquareLogo: Decodable {
    let path: String
    let width: Int
    let height: Int
    let entity: String
    let server: String
    let filename: String
    
    enum CodingKeys: String, CodingKey {
        case path, width, height, entity, server, filename
    }
    
}
