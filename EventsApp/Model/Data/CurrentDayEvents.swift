//
//  CurrentDayEvents.swift
//  EventsApp
//
//  Created by Darya Charniankova on 10.06.23.
//

import SwiftUI

struct CurrentDayEvents: Decodable {
    let numberOfEvents: Int?
    let lang: String?
    let textFormat: String?
    let city: String?
    var date: String?
    let object: CurrentEvent?
    
    enum CodingKeys: String, CodingKey {
        case lang, date, object,
             textFormat = "text_format",
             numberOfEvents = "page_size",
             city = "location"
    }

    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<CurrentDayEvents.CodingKeys> = try decoder.container(keyedBy: CurrentDayEvents.CodingKeys.self)
        
        self.lang = try container.decodeIfPresent(String.self,
                                                  forKey: CurrentDayEvents.CodingKeys.lang)
        
        self.object = try container.decodeIfPresent(CurrentEvent.self,
                                                    forKey: CurrentDayEvents.CodingKeys.object)
        self.textFormat = try container.decodeIfPresent(String.self,
                                                        forKey: CurrentDayEvents.CodingKeys.textFormat)
        self.numberOfEvents = try container.decodeIfPresent(Int.self,
                                                            forKey: CurrentDayEvents.CodingKeys.numberOfEvents)
        self.city = try container.decodeIfPresent(String.self,
                                                  forKey: CurrentDayEvents.CodingKeys.city)
        
        self.date = try container.decodeIfPresent(String.self,
                                                  forKey: CurrentDayEvents.CodingKeys.date)
        
        if let dateValue = try? container.decodeIfPresent(Date.self,
                                                            forKey: CurrentDayEvents.CodingKeys.date) {
            self.date = dateValue.description
        } else {
            self.date = try container.decodeIfPresent(String.self,
                                                                forKey: CurrentDayEvents.CodingKeys.date)
        }
        
    }
}
