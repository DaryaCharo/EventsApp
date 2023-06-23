//
//  OrderBy.swift
//  EventsApp
//
//  Created by Darya Charniankova on 10.06.23.
//

import Foundation

struct EventOrder: Decodable {
    let id: Int
    let title: String
    let slug: String
    let place: String
    let description: String
    let location: String
    let tagline: String
    let price: String // потому что даёт строку "входной билет по цене 1200 - 1800 рублей" например
    let publicationDate: Date
    let bodyText: String
    let ageRestriction: Int
    let isFree: Bool
    let favouriteCount: Int
    let shortTitle: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, slug, place, description, location, tagline, price,
             publicationDate = "publication_date",
             bodyText = "body_text",
             ageRestriction = "age_restriction",
             isFree = "is_free",
             favouriteCount = "favorites_count",
             shortTitle = "short_title"
    }
}
