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
    var bio: String
    
    enum CodingKeys: String, CodingKey {
        case id = "ID",
             email = " Email",
             fullName = "Full name",
             bio = "Bio"
    }
}


