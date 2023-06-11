//
//  CurrentDayEvents.swift
//  EventsApp
//
//  Created by Darya Charniankova on 10.06.23.
//

import Foundation

struct CurrentDayEvents: Decodable {
    let lang: String
    let numberOfEvents: Int
    let fields: CurrentEventFields
    let city: String
    let date: Date
    let expand: ExpandList
    
    enum CodingKeys: String, CodingKey {
        case lang, fields, date, expand,
             numberOfEvents = "page_size",
             city = "location"
    }
}

struct CurrentEventFields: Decodable {
    let date: Date
    let event: CurrentEvent
    let city: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case date, title, event,
             city = "location"
    }
}

struct CurrentEvent: Decodable {
    let id: Int
    let type: String
    let favouritesCount: Int
    let description: String
    let dateRange: Dates
    let images: EventImages
    //for movies
    let country: String
    let year: Int
    let runningTime: Int
    let poster: [EventImages]
    let genres: [Genres]
    let ageRestriction: String
    
    enum CodingKeys: String, CodingKey {
        case id, description, country, year, genres, poster,
             images = "first_image",
             dateRange = "daterange",
             type = "ctype",
             runningTime = "running_time",
             favouritesCount = "favorites_count",
             ageRestriction = "age_restriction"
    }
}

//for movies

struct Genres: Decodable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
    }
}
