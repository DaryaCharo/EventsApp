//
//  Dates.swift
//  EventsApp
//
//  Created by Darya Charniankova on 10.06.23.
//

import Foundation

struct Dates: Decodable {
    let start: Date?
    let end: Date?
    let isStart: Bool
    let isContinue: Bool
    let isEnd: Bool
    let schedules: [Data]
    
    enum CodingKeys: String, CodingKey {
        case schedules,
             start,
             end,
             isStart = "is_startless",
             isContinue = "is_continuous",
             isEnd = "is_endless"
    }
}
