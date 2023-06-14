//
//  Categories.swift
//  EventsApp
//
//  Created by Darya Charniankova on 10.06.23.
//

import Foundation

struct Categories: Decodable {
    
    let lang: String
    let fields: CategoryFields
    let orderBy: EventOrder
    
    enum CodingKeys: String, CodingKey {
        case lang, fields, orderBy
    }
}

//fields

struct CategoryFields: Decodable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
}


