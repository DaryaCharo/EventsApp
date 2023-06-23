//
//  Date + Extension.swift
//  EventsApp
//
//  Created by Darya Charniankova on 10.06.23.
//

import Foundation

extension Date {
    
    func getDate(dateType: DateType, unix: Int = 0) -> String {
        let formatter = DateFormatter()
        let date = Date(timeIntervalSince1970: TimeInterval(unix))
        
        switch dateType {
        case .monthDayYear:
            formatter.dateFormat = dateType.getDate
            return formatter.string(from: self)
        case .yearMonthDay:
            formatter.dateFormat = dateType.getDate
            return formatter.string(from: self)
        case .weekDayDayYear:
            formatter.dateFormat = dateType.getDate
            return formatter.string(from: date)
        case .time:
            formatter.dateFormat = "HH:mm a"
            return formatter.string(from: date)
        }
    }
}

enum DateType {
    case monthDayYear, weekDayDayYear, time, yearMonthDay
    
    var getDate: String {
        switch self {
        case .monthDayYear:
            return "MMM d, yyyy"
        case .weekDayDayYear:
            return "EEEE, d, yyyy"
        case .time:
            return "HH:mm a"
        case .yearMonthDay:
            return "yyyy-MM-dd"
        }
    }
}
