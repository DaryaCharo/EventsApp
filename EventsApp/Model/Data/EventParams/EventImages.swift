//
//  EventImages.swift
//  EventsApp
//
//  Created by Darya Charniankova on 10.06.23.
//

import Foundation

struct EventImages: Decodable {
    let image: String
    let source: ImageSource
    let thumbnails: [String]
    
    enum CodingKeys: String, CodingKey {
        case image, source, thumbnails
    }
}

struct ImageSource: Decodable {
    let link: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case link, name
    }
}

