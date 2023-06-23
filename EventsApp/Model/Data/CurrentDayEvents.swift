//
//  CurrentDayEvents.swift
//  EventsApp
//
//  Created by Darya Charniankova on 10.06.23.
//

import Foundation

struct CurrentDayEvents: Decodable {
    let numberOfEvents: Int?
    let lang: String?
    let textFormat: String?
    let city: String?
    let date: String?
    let object: CurrentEvent?
    
    enum CodingKeys: String, CodingKey {
        case lang, date, object,
             textFormat = "text_format",
             numberOfEvents = "page_size",
             city = "location"
    }
}

struct CurrentEventFields: Decodable {
    let date: String?
    let event: CurrentEvent
    let city: String?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case date, title,
             event = "object",
             city = "location"
    }
}

struct CurrentEvent: Decodable {
    let id: Int
    let type: String
    let favouritesCount: Int?
    let description: String?
    let dateRange: Dates?
    let images: EventImages?
    //for movies
    let country: String?
    let year: Int?
    let runningTime: Int?
    let poster: [EventImages]?
    let genres: [Genres]?
    let ageRestriction: String?
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<CurrentEvent.CodingKeys> = try decoder.container(keyedBy: CurrentEvent.CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: CurrentEvent.CodingKeys.id)
        self.type = try container.decode(String.self, forKey: CurrentEvent.CodingKeys.type)
        self.favouritesCount = try container.decodeIfPresent(Int.self, forKey: CurrentEvent.CodingKeys.favouritesCount)
        self.description = try container.decodeIfPresent(String.self, forKey: CurrentEvent.CodingKeys.description)?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        self.dateRange = try container.decodeIfPresent(Dates.self, forKey: CurrentEvent.CodingKeys.dateRange)
        self.images = try container.decodeIfPresent(EventImages.self, forKey: CurrentEvent.CodingKeys.images)
        self.country = try container.decodeIfPresent(String.self, forKey: CurrentEvent.CodingKeys.country)
        self.year = try container.decodeIfPresent(Int.self, forKey: CurrentEvent.CodingKeys.year)
        self.runningTime = try container.decodeIfPresent(Int.self, forKey: CurrentEvent.CodingKeys.runningTime)
        self.poster = try container.decodeIfPresent([EventImages].self, forKey: CurrentEvent.CodingKeys.poster)
        self.genres = try container.decodeIfPresent([Genres].self, forKey: CurrentEvent.CodingKeys.genres)
        
        if let stringValue = try? container.decodeIfPresent(Int.self, forKey: CurrentEvent.CodingKeys.ageRestriction) {
            self.ageRestriction = stringValue.description
        } else {
            self.ageRestriction = try container.decodeIfPresent(String.self, forKey: CurrentEvent.CodingKeys.ageRestriction)
        }
    }

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
