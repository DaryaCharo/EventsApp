//
//  Dates.swift
//  EventsApp
//
//  Created by Darya Charniankova on 10.06.23.
//

import Foundation

struct Dates: Decodable {
    var startDate: Date?
    let start: Int?
    let end: Date?
    let isStart: Bool
    let isContinue: Bool
    let isEnd: Bool
    
    enum CodingKeys: String, CodingKey {
        case start, end,
             startDate = "start_date",
             isStart = "is_startless",
             isContinue = "is_continuous",
             isEnd = "is_endless"
    }
    
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<Dates.CodingKeys> = try decoder.container(keyedBy: Dates.CodingKeys.self)
        
        self.start = try container.decodeIfPresent(Int.self,
                                                   forKey: Dates.CodingKeys.start)
        self.end = try container.decodeIfPresent(Date.self,
                                                 forKey: Dates.CodingKeys.end)
        self.isStart = try container.decode(Bool.self,
                                            forKey: Dates.CodingKeys.isStart)
        self.isContinue = try container.decode(Bool.self,
                                               forKey: Dates.CodingKeys.isContinue)
        self.isEnd = try container.decode(Bool.self,
                                          forKey: Dates.CodingKeys.isEnd)
        if let stringValue = try? container.decodeIfPresent(String.self,
                                                            forKey: Dates.CodingKeys.startDate) {
            self.startDate = stringValue.getDate()
        } else {
            self.startDate = try container.decodeIfPresent(Date.self,
                                                           forKey: Dates.CodingKeys.startDate)
        }
    }
}
