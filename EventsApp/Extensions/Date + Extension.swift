//
//  Date + Extension.swift
//  EventsApp
//
//  Created by Darya Charniankova on 10.06.23.
//

import Foundation

extension Date {
    
    func getDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter.string(from: self)
    }
    
    func getDate(unix: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(unix))
        let formatter = DateFormatter()
        
        formatter.dateFormat = "EEEE, d, yyyy"
        
        return formatter.string(from: date)
    }
    
    func getTime(unix: Int) -> String {
        let time = Date(timeIntervalSince1970: TimeInterval(unix))
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm a"
        
        return formatter.string(from: time)
    }
}
