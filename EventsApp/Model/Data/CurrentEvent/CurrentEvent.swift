//
//  CurrentEvent.swift
//  EventsApp
//
//  Created by Darya Charniankova on 23.06.23.
//

import Foundation

struct CurrentEvent: Decodable {
    let id: Int
    let type: String
    let title: String?
    let favouritesCount: Int?
    let description: String?
    let dateRange: Dates?
    let images: EventImages?
    let actualSince: Int?
    //for movies
    let country: String?
    let year: Int?
    let runningTime: Int?
    let poster: [EventImages]?
    let genres: [Genres]?
    let ageRestriction: String?
    let place: PlaceForCurrentEvent?
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<CurrentEvent.CodingKeys> = try decoder.container(keyedBy: CurrentEvent.CodingKeys.self)
        
        self.id = try container.decode(Int.self,
                                       forKey: CurrentEvent.CodingKeys.id)
        self.type = try container.decode(String.self,
                                         forKey: CurrentEvent.CodingKeys.type)
        self.place = try container.decodeIfPresent(PlaceForCurrentEvent.self,
                                                   forKey: CurrentEvent.CodingKeys.place)
        self.title = try container.decodeIfPresent(String.self,
                                                   forKey: CurrentEvent.CodingKeys.title)
        self.favouritesCount = try container.decodeIfPresent(Int.self,
                                                             forKey: CurrentEvent.CodingKeys.favouritesCount)
        self.description = try container.decodeIfPresent(String.self,
                                                         forKey: CurrentEvent.CodingKeys.description)?.replacingOccurrences(of: "<[^>]+>",
                                                                                                                            with: "", options: .regularExpression,
                                                                                                                            range: nil)
        self.dateRange = try container.decodeIfPresent(Dates.self,
                                                       forKey: CurrentEvent.CodingKeys.dateRange)
        self.images = try container.decodeIfPresent(EventImages.self,
                                                    forKey: CurrentEvent.CodingKeys.images)
        self.actualSince = try container.decodeIfPresent(Int.self,
                                                         forKey: CurrentEvent.CodingKeys.actualSince)
        self.country = try container.decodeIfPresent(String.self,
                                                     forKey: CurrentEvent.CodingKeys.country)
        self.year = try container.decodeIfPresent(Int.self,
                                                  forKey: CurrentEvent.CodingKeys.year)
        self.runningTime = try container.decodeIfPresent(Int.self,
                                                         forKey: CurrentEvent.CodingKeys.runningTime)
        self.poster = try container.decodeIfPresent([EventImages].self,
                                                    forKey: CurrentEvent.CodingKeys.poster)
        self.genres = try container.decodeIfPresent([Genres].self,
                                                    forKey: CurrentEvent.CodingKeys.genres)
        
        if let intValue = try? container.decodeIfPresent(Int.self,
                                                         forKey: CurrentEvent.CodingKeys.ageRestriction) {
            self.ageRestriction = intValue.description
        } else {
            self.ageRestriction = try container.decodeIfPresent(String.self,
                                                                forKey: CurrentEvent.CodingKeys.ageRestriction)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, country, year, genres, poster, place,
             images = "first_image",
             actualSince = "actual_since",
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

struct EventImages: Decodable {
    let image: String?
    
    
    enum CodingKeys: String, CodingKey {
        case image
    }
}
