//
//  ListEvents.swift
//  EventsApp
//
//  Created by Darya Charniankova on 5.07.23.
//

import Foundation

struct ListEvent: Decodable {
    let id: Int
    let title: String?
    let categories: [Categories]?
    let favouritesCount: Int?
    let description: String?
    let dates: [Dates]?
    let images: EventImages?
    let actualSince: Int?
    let ageRestriction: String?
    let place: PlaceForEventFromList?
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, categories, dates, place,
             images = "first_image",
             actualSince = "actual_since",
             favouritesCount = "favorites_count",
             ageRestriction = "age_restriction"
    }
}
