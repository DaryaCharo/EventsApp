//
//  String + Extension.swift
//  EventsApp
//
//  Created by Darya Charniankova on 16.07.23.
//

import Foundation

extension String {
    func getDate() -> Date? {
        let dateFormatter = DateFormatter()
        let calendar = Calendar.current
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let dateFromString = dateFormatter.date(from: self) else { return nil }
        let components = calendar.dateComponents([.year, .month, .day], from: dateFromString)
        return calendar.date(from:components)
    }
}
