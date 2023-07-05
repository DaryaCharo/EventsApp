//
//  Dates.swift
//  EventsApp
//
//  Created by Darya Charniankova on 10.06.23.
//

import Foundation

struct Dates: Decodable {
    let start: String?
    let end: Date?
    let isStart: Bool
    let isContinue: Bool
    let isEnd: Bool
    
    enum CodingKeys: String, CodingKey {
        case end,
             start = "start_date",
             isStart = "is_startless",
             isContinue = "is_continuous",
             isEnd = "is_endless"
    }
}
