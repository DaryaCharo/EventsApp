//
//  Categories.swift
//  EventsApp
//
//  Created by Darya Charniankova on 10.06.23.
//

import Foundation

struct Categories: Decodable {
    
    let id: Int
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
}


