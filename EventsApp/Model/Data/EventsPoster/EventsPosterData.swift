//
//  EventAfishaData.swift
//  EventsApp
//
//  Created by Darya Charniankova on 7.06.23.
//

import Foundation

struct EventsPosterData: Decodable {
    let version: String
    let lang: [Language] // по умолчанию ru
    let page: Int
    let pageSize: String
    let fields: [CurrentPlaceData]
    let date: Date //только события на указанную дату
    let city: String
    
    enum CodingKeys: String, CodingKey {
        case version, lang, page, pageSize, fields, date
        case city = "location"
    }
}

//

struct CurrentPlaceData: Decodable {
    let date: Date
    let event: String
    let city: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case date, title
        case event = "object"
        case city = "location"
    }
}

struct Language: Decodable {
    let ru: String
    let en: String
    
    enum CodingKeys: String, CodingKey {
        case ru, en
    }
}
