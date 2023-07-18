//
//  UserData.swift
//  EventsApp
//
//  Created by Darya Charniankova on 19.06.23.
//

import Foundation

struct UserData: Identifiable, Codable {
    var id: String
    var email: String
    var fullName: String
    var avatar: Data
    
    enum CodingKeys: String, CodingKey {
        case id, email,
        fullName = "Full name",
        avatar = "Avatar"
    }
}


