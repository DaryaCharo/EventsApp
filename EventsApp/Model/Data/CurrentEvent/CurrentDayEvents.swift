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
    var date: Date?
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
        
        if let stringValue = try? container.decodeIfPresent(String.self,
                                                            forKey: CurrentDayEvents.CodingKeys.date) {
            getDate(stringDate: stringValue)
        } else {
            self.date = try container.decodeIfPresent(Date.self,
                                                      forKey: CurrentDayEvents.CodingKeys.date)
        }
    }
    
    private mutating func getDate(stringDate: String) {
        let dateFormatter = DateFormatter()
        let calendar = Calendar.current
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: stringDate) else { return }
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        self.date = calendar.date(from:components)
    }
}
