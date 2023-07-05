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
    let categories: Categories?
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
    let place: PlaceForEventFromList?
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<ListEvent.CodingKeys> = try decoder.container(keyedBy: ListEvent.CodingKeys.self)
        
        self.id = try container.decode(Int.self,
                                       forKey: ListEvent.CodingKeys.id)
        self.place = try container.decode(PlaceForEventFromList.self,
                                          forKey: ListEvent.CodingKeys.place)
        self.title = try container.decodeIfPresent(String.self,
                                                   forKey: ListEvent.CodingKeys.title)
        self.categories = try container.decode(Categories.self,
                                                forKey: ListEvent.CodingKeys.categories)
        self.favouritesCount = try container.decodeIfPresent(Int.self,
                                                             forKey: ListEvent.CodingKeys.favouritesCount)
        self.description = try container.decodeIfPresent(String.self,
                                                         forKey: ListEvent.CodingKeys.description)?.replacingOccurrences(of: "<[^>]+>",
                                                                                                                            with: "", options: .regularExpression,
                                                                                                                            range: nil)
        self.dateRange = try container.decodeIfPresent(Dates.self,
                                                       forKey: ListEvent.CodingKeys.dateRange)
        self.images = try container.decodeIfPresent(EventImages.self,
                                                    forKey: ListEvent.CodingKeys.images)
        self.actualSince = try container.decodeIfPresent(Int.self,
                                                         forKey: ListEvent.CodingKeys.actualSince)
        self.country = try container.decodeIfPresent(String.self,
                                                     forKey: ListEvent.CodingKeys.country)
        self.year = try container.decodeIfPresent(Int.self,
                                                  forKey: ListEvent.CodingKeys.year)
        self.runningTime = try container.decodeIfPresent(Int.self,
                                                         forKey: ListEvent.CodingKeys.runningTime)
        self.poster = try container.decodeIfPresent([EventImages].self,
                                                    forKey: ListEvent.CodingKeys.poster)
        self.genres = try container.decodeIfPresent([Genres].self,
                                                    forKey: ListEvent.CodingKeys.genres)
        
        if let intValue = try? container.decodeIfPresent(Int.self,
                                                         forKey: ListEvent.CodingKeys.ageRestriction) {
            self.ageRestriction = intValue.description
        } else {
            self.ageRestriction = try container.decodeIfPresent(String.self,
                                                                forKey: ListEvent.CodingKeys.ageRestriction)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, country, year, genres, poster, place, categories,
             images = "first_image",
             actualSince = "actual_since",
             dateRange = "daterange",
             runningTime = "running_time",
             favouritesCount = "favorites_count",
             ageRestriction = "age_restriction"
    }
}
