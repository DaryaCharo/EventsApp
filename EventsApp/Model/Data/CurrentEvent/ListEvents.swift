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
    
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<ListEvent.CodingKeys> = try decoder.container(keyedBy: ListEvent.CodingKeys.self)
        
        self.id = try container.decode(Int.self,
                                       forKey: ListEvent.CodingKeys.id)
        
        self.title = try container.decodeIfPresent(String.self,
                                                   forKey: ListEvent.CodingKeys.title)
        
        self.description = try container.decodeIfPresent(String.self,
                                                         forKey: ListEvent.CodingKeys.description)
        
        self.categories = try container.decodeIfPresent([Categories].self,
                                                        forKey: ListEvent.CodingKeys.categories)
        
        self.dates = try container.decodeIfPresent([Dates].self,
                                                   forKey: ListEvent.CodingKeys.dates)
        
        self.place = try container.decodeIfPresent(PlaceForEventFromList.self,
                                                   forKey: ListEvent.CodingKeys.place)
        
        self.images = try container.decodeIfPresent(EventImages.self,
                                                    forKey: ListEvent.CodingKeys.images)
        
        self.actualSince = try container.decodeIfPresent(Int.self,
                                                         forKey: ListEvent.CodingKeys.actualSince)
        
        self.favouritesCount = try container.decodeIfPresent(Int.self,
                                                             forKey: ListEvent.CodingKeys.favouritesCount)
        
        if let intValue = try? container.decodeIfPresent(Int.self,
                                                         forKey: ListEvent.CodingKeys.ageRestriction) {
            self.ageRestriction = intValue.description
        } else {
            self.ageRestriction = try container.decodeIfPresent(String.self,
                                                                forKey: ListEvent.CodingKeys.ageRestriction)
        }
        
    }
}
